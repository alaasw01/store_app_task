part of '../view/product_details.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.prodcutDetailsUseCase)
      : super(ProductDetailsInitial());

  int selectedItem = 0;
  num? productId;
  changeSelectedProductImage(int item) {
    selectedItem = item;
    emit(ProductDetailsChangeProductImage());
  }

  final ProdcutDetailsUseCase prodcutDetailsUseCase;
  Product? productDetails;
  var homeCubit = AppConstant.ctx!.read<HomeCubit>();

  initCubit({required num id}) async {
    await getProductDetails(id: id);
    checkFavorite();
  }

  Future<void> getProductDetails({required num id}) async {
    emit(ProductDetailsLoading());

    var result = await prodcutDetailsUseCase.call(id: id);
    productId = id;
    result.fold(
      (failure) {
        emit(ProductDetailsFailed(
            errorMessage: 'fetch items failed, please try again.'));
      },
      (products) async {
        if (products != null) {
          productDetails = products;
          // context.go(Routes.home);

          emit(ProductDetailSuccess());
        } else {
          emit(ProductDetailsFailed(errorMessage: 'failed fetch items.'));
        }
      },
    );
  }

  onFavoriteTap() {
    final updatedProduct = Product(
      id: productDetails?.productId,
      brand: productDetails?.productBrand,
      title: productDetails?.productTitle,
      category: productDetails?.productCategory,
      description: productDetails?.productDescription,
      thumbnail: productDetails?.imageUrl,
      price: productDetails?.productPrice,
      rating: productDetails?.productRating,
      isProdcutFavorite: productDetails?.isProdcutFavorite ?? false,
    );

    homeCubit.onFavoriteTap(updatedProduct);

    final isNowFavorite = homeCubit.favoritesList.any(
      (element) => element.productId == productDetails?.productId,
    );

    productDetails?.isProdcutFavorite = isNowFavorite;

    emit(ProductDetailSuccess());
  }

  void checkFavorite() {
    for (ProductEntity element in homeCubit.favoritesList) {
      if (element.productId == productDetails?.id) {
        productDetails?.isProdcutFavorite = element.isFavorite;
        emit(ProductDetailSuccess());
      }
    }
    // productDetails?.isProdcutFavorite = false;
    emit(ProductDetailSuccess());
  }

  void goToHomeProducts(BuildContext context) {
    final homeCubit = context.read<ProductDetailsCubit>().homeCubit;
    homeCubit.getFavoritesItems();
    homeCubit.checkFavoriteItem();
    context.go(Routes.home);
  }
}
