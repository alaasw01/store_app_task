part of '../product_details.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({
    super.key,
    this.isSelected,
    this.onTap,
  });
  final bool? isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: 75,
        height: 70,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: isSelected == true
                    ? AppColors.lightOrangeColor
                    : Colors.grey[300]!),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                color: isSelected == true
                    ? AppColors.lightOrangeColor
                    : Colors.grey[200]!,
                offset: const Offset(0, 3),
                spreadRadius: 1,
              )
            ]),
        child: Center(
          child: Image.asset(
            AppImages.product,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
