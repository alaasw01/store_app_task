// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:store_app_task/contants/app_color.dart';
import 'package:store_app_task/contants/app_style.dart';

class CustomLoadingButton extends StatelessWidget {
  const CustomLoadingButton({
    super.key,
    required this.onTap,
    required this.text,
    this.color = AppColors.meduimGreenColor,
    this.isLogin = false,
    this.textColor = AppColors.darkGreenColor,
    // required this.fontSize,
  });

  final String text;
  final Color? color;
  final Color? textColor;
  final bool? isLogin;
  // final double fontSize;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return LoadingBtn(
      height: isLogin == false ? 30 : 40,
      width: isLogin == false
          ? MediaQuery.sizeOf(context).width * 0.25
          : MediaQuery.sizeOf(context).width * 0.6,
      borderRadius: 8,
      animate: true,
      color: color,
      loader: const SizedBox(
        width: 22,
        height: 22,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2,
        ),
      ),
      child: Text(text,
          style: AppStyles.textStyle16
              .copyWith(color: textColor, fontWeight: FontWeight.w600)),
      onTap: (startLoading, stopLoading, btnState) async {
        if (btnState == ButtonState.idle) {
          startLoading();
          await onTap();
          stopLoading();
        }
      },
    );
  }
}
