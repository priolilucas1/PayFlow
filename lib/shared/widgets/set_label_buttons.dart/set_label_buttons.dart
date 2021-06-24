import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/divider/divider_vertical.dart';
import 'package:payflow/shared/widgets/label_button.dart/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  const SetLabelButtons({
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    this.enablePrimaryColor = false,
  });

  final String primaryLabel;
  final String secondaryLabel;
  final bool enablePrimaryColor;
  final VoidCallback primaryOnPressed;
  final VoidCallback secondaryOnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: LabelButton(
              label: primaryLabel,
              onPressed: primaryOnPressed,
              style: enablePrimaryColor ? TextStyles.buttonPrimary : null,
            ),
          ),
          DividerVertical(),
          Expanded(
            child: LabelButton(
              label: secondaryLabel,
              onPressed: secondaryOnPressed,
            ),
          ),
        ],
      ),
    );
  }
}
