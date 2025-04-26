part of '../presentation/view/product_details.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  int selectedItem = 0;
  changeSelectedProductImage(int item) {
    selectedItem = item;
    emit(ProductDetailsChangeProductImage());
  }
}
