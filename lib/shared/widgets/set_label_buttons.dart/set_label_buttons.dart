import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/widgets/divider/divider_vertical.dart';
import 'package:payflow/shared/widgets/label_button.dart/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  const SetLabelButtons({
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    this.enablePrimaryColor = false,
    this.enableSecondaryColor = false,
  });

  final String primaryLabel;
  final String secondaryLabel;
  final bool enablePrimaryColor;
  final bool enableSecondaryColor;
  final VoidCallback primaryOnPressed;
  final VoidCallback secondaryOnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      height: 57,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 1,
            height: 1,
            color: AppColors.stroke,
          ),
          Container(
            height: 56,
            child: Row(
              children: [
                if (enablePrimaryColor) ...[
                  LabelButton.primary(
                    label: primaryLabel,
                    onPressed: primaryOnPressed,
                  ),
                ] else ...[
                  LabelButton.heading(
                    label: primaryLabel,
                    onPressed: primaryOnPressed,
                  ),
                ],
                DividerVertical(
                  height: 56,
                ),
                if (enableSecondaryColor) ...[
                  LabelButton.primary(
                    label: secondaryLabel,
                    onPressed: secondaryOnPressed,
                  )
                ] else ...[
                  LabelButton.heading(
                    label: secondaryLabel,
                    onPressed: secondaryOnPressed,
                  )
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
