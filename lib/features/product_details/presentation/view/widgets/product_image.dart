part of '../product_details.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    this.isFavorite,
  });
  final bool? isFavorite;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Small product images (left side)
        SizedBox(
          width: 80,
          height: 220,
          child: ListView.builder(
            itemCount: context
                .read<ProductDetailsCubit>()
                .productDetails
                ?.images
                ?.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => ProductImages(
              imageUrl: context
                      .read<ProductDetailsCubit>()
                      .productDetails
                      ?.images?[index] ??
                  '',
              isSelected:
                  index == context.read<ProductDetailsCubit>().selectedItem
                      ? true
                      : false,
              onTap: () => context
                  .read<ProductDetailsCubit>()
                  .changeSelectedProductImage(index),
            ),
          ),
        ),
        const SizedBox(width: 20),
        // Main product image (right side)
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Center(
                child: context
                            .read<ProductDetailsCubit>()
                            .productDetails
                            ?.images
                            ?.isNotEmpty ==
                        true
                    ? Hero(
                        tag: context.read<ProductDetailsCubit>().productId ?? 0,
                        child: CachedNetworkImage(
                          imageUrl: context
                                      .read<ProductDetailsCubit>()
                                      .productDetails
                                      ?.images?[
                                  context
                                      .read<ProductDetailsCubit>()
                                      .selectedItem] ??
                              '',
                          fit: BoxFit.contain,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.lightOrangeColor,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      )
                    : Image.asset(
                        AppImages.product,
                        fit: BoxFit.contain,
                        height: 170,
                      ),
              ),
              Positioned(
                top: -15,
                right: 10,
                child: InkWell(
                  onTap: () =>
                      context.read<ProductDetailsCubit>().onFavoriteTap(),
                  child: Icon(
                    isFavorite == true ? Icons.favorite : Icons.favorite_border,
                    size: 30,
                    color: AppColors.orangeColor,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.orangeColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    context
                            .read<ProductDetailsCubit>()
                            .productDetails
                            ?.category ??
                        '',
                    style: AppStyles.textStyle14.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
