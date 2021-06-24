import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class DividerVertical extends StatelessWidget {
  const DividerVertical({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: height,
      color: AppColors.stroke,
    );
  }
}
