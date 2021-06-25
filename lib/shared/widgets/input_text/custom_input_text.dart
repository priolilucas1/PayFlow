import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/divider/divider_vertical.dart';

class CustomInputText extends StatelessWidget {
  const CustomInputText({
    required this.label,
    required this.icon,
    required this.onChanged,
    this.initialValue,
    this.validator,
    this.controller,
  });

  final String label;
  final IconData icon;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            TextFormField(
              onChanged: onChanged,
              validator: validator,
              controller: controller,
              style: TextStyles.input,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: label,
                labelStyle: TextStyles.input,
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Icon(
                        icon,
                        color: AppColors.primary,
                      ),
                    ),
                    DividerVertical(height: 48),
                  ],
                ),
                border: InputBorder.none,
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.stroke,
            ),
          ],
        ),
      ),
    );
  }
}
