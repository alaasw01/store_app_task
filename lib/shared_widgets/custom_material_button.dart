import 'package:flutter/material.dart';
import 'package:store_app_task/utils/store_app.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.title,
    this.color,
    this.onPressed,
    this.radius,
    this.borderColor,
  });

  final String title;
  final Color? color;
  final Color? borderColor;
  final double? radius;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 40,
      child: MaterialButton(
        minWidth: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          side: borderColor != null
              ? BorderSide(
                  color: borderColor!,
                )
              : BorderSide.none,
          borderRadius: BorderRadius.circular(radius ?? 8),
        ),
        onPressed: onPressed ?? () {},
        color: color ?? AppColors.darkGreenColor,
        child: Text(
          title,
          style: AppStyles.textStyle18
              .copyWith(color: borderColor ?? Colors.white),
        ),
      ),
    );
  }
}
