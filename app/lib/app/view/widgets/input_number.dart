import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputNumber extends StatelessWidget {
  final String hintText;
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const InputNumber({
    required this.hintText,
    required this.title,
    required this.controller,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyle.inputLabel),
        SizedBox(height: 8),
        TextFormField(
          validator: validator,
          controller: controller,
          style: AppTextStyle.inputText,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.numberWithOptions(),
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () => controller.clear(),
              icon: Icon(Icons.clear),
            ),
            filled: true,
            fillColor: AppColors.surface,
            hintText: hintText,
            hintStyle: AppTextStyle.hintText,
            labelStyle: const TextStyle(color: AppColors.primary),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.divider,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.error, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.error, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
