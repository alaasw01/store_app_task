part of '../view/home_view.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.prodcutsUseCase) : super(HomeInitial()) {
    getAllProducts();
  }
  final ProdcutsUseCase prodcutsUseCase;
  List<Product>? productsList;
  Future<void> getAllProducts() async {
    emit(HomeLoading());

    var result = await prodcutsUseCase.call();

    result.fold(
      (failure) {
        emit(HomeFailed(errorMessage: 'fetch items failed, please try again.'));
      },
      (products) async {
        if (products != null) {
          productsList = products.products;
          // context.go(Routes.home);

          emit(HomeSuccess());
        } else {
          emit(HomeFailed(errorMessage: 'failed fetch items.'));
        }
      },
    );
  }
}
