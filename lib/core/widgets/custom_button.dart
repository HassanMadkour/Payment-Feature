import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_colors.dart';
import 'package:payment_app/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });
  final String text;
  final bool isLoading;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        padding: const EdgeInsets.all(24),
        minWidth: MediaQuery.sizeOf(context).width,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: onPressed,
        color: AppColors.green,
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Text(text, style: AppStyles.medium22),
      ),
    );
  }
}
