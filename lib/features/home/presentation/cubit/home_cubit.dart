part of '../view/home_view.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.prodcutsUseCase) : super(HomeInitial());

  final ProdcutsUseCase prodcutsUseCase;
  List<Product> allProducts = []; // Store full data
  List<Product> productsList = []; // Used for display (filtered or unfiltered)

  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  Timer? debounce;
  bool isLoading = false;
  bool hasMore = true;
  final int limit = 15;
  int skip = 0;
  double minPrice = 0;
  double maxPrice = 2000;
  bool isPriceRangeVisible = false;
  RangeValues rangeValues = const RangeValues(0, 2000);

  void initCubit() {
    _setupScrollListener();
    getAllProducts();
  }

  onRangeChanged(RangeValues valuse) {
    rangeValues = valuse;
    emit(HomeSuccess());
  }

  void showPriceRangeSlider() {
    isPriceRangeVisible = !isPriceRangeVisible;
    emit(HomeSuccess());
  }

  void updateFilteredProducts() {
    productsList = allProducts.where((product) {
      final price = product.price ?? 0;
      return price >= rangeValues.start && price <= rangeValues.end;
    }).toList();
    emit(HomeSuccess());
  }

  void _setupScrollListener() {
    scrollController.addListener(() {
      if (!isLoading &&
          hasMore &&
          scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200) {
        getAllProducts();
      }
    });
  }

  Future<void> getAllProducts({String? search}) async {
    if (isLoading) return;

    isLoading = true;

    final result = await prodcutsUseCase.call(
      search: search,
      limit: limit,
      skip: skip,
    );

    result.fold(
      (failure) {
        isLoading = false;
        emit(HomeFailed(errorMessage: 'Fetch items failed, please try again.'));
      },
      (products) {
        isLoading = false;

        if (products != null && products.products != null) {
          allProducts.addAll(products.products!);
          productsList = List.from(allProducts); // Initial display
          skip = allProducts.length;
          hasMore = allProducts.length < (products.total ?? 0);

          // Calculate price range
          clculateMinAndMaxPrice();

          emit(HomeSuccess());
        } else {
          emit(HomeFailed(errorMessage: 'Failed to fetch items.'));
        }
      },
    );
  }

  void clculateMinAndMaxPrice() {
    var prices = productsList.map((e) => e.price ?? 0).toList();
    if (prices.isNotEmpty) {
      minPrice = prices.reduce(min).toDouble();
      maxPrice = prices.reduce(max).toDouble();
      rangeValues = RangeValues(minPrice ?? 0, maxPrice ?? 0);
    }
  }

  void searchProducts() {
    if (debounce?.isActive ?? false) debounce!.cancel();

    debounce = Timer(const Duration(milliseconds: 300), () async {
      clearList();
      await getAllProducts(search: searchController.text.toLowerCase().trim());
      emit(HomeSearch());
    });
  }

  void clearSearch() {
    searchController.clear();
    clearList();
    getAllProducts();
    emit(HomeInitial());
  }

  void clearList() {
    productsList.clear();
    skip = 0;
    hasMore = true;
  }

  @override
  Future<void> close() {
    debounce?.cancel();
    scrollController.dispose();
    searchController.dispose();
    return super.close();
  }
}
