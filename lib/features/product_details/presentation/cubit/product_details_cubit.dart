part of '../view/product_details.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.prodcutDetailsUseCase)
      : super(ProductDetailsInitial());

  int selectedItem = 0;
  changeSelectedProductImage(int item) {
    selectedItem = item;
    emit(ProductDetailsChangeProductImage());
  }

  final ProdcutDetailsUseCase prodcutDetailsUseCase;
  Product? productDetails;
  Future<void> getProductDetails({required num id}) async {
    emit(ProductDetailsLoading());

    var result = await prodcutDetailsUseCase.call(id: id);

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
}
