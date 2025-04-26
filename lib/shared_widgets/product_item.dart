part of '../features/home/presentation/view/home_view.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    this.onFavoriteTap,
    this.onDetailsTap,
  });
  final void Function()? onFavoriteTap;
  final void Function()? onDetailsTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200]!,
              offset: const Offset(0, 3),
              blurRadius: 4,
              spreadRadius: 3,
            )
          ]),
      child: Column(
        children: [
          GestureDetector(
            onTap: onDetailsTap,
            child: Image.asset(
              AppImages.product,
              height: 100,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Product name',
            style: AppStyles.textStyle16.copyWith(
              color: AppColors.darkGreenColor,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onFavoriteTap,
                child: const Icon(
                  Icons.favorite_border,
                  color: AppColors.darkGreenColor,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                '500 EGP',
                style: AppStyles.textStyle14.copyWith(
                  color: AppColors.orangeColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
