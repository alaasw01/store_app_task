part of '../login_view.dart';

class CustomReactiveFormFeild extends StatelessWidget {
  const CustomReactiveFormFeild({
    super.key,
    this.formControlName,
    this.labelText,
    required this.icon,
    this.obscureText = false,
    this.validationMessages,
  });
  final String? formControlName;
  final String? labelText;
  final IconData icon;
  final bool? obscureText;
  final Map<String, String Function(Object)>? validationMessages;
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<String>(
      formControlName: formControlName,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(
          icon,
          color: AppColors.darkGreenColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: AppColors.darkGreenColor, width: 2),
        ),
      ),
      validationMessages: validationMessages,
    );
  }
}
