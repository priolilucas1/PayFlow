import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';

class BoletoInfo extends StatefulWidget {
  final int size;
  BoletoInfo({Key? key, required this.size}) : super(key: key);

  @override
  _BoletoInfoState createState() => _BoletoInfoState();
}

class _BoletoInfoState extends State<BoletoInfo> {
  final controller = BoletoListController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AppImages.logomini,
                width: 56,
                height: 34,
                color: AppColors.background,
              ),
              Container(
                width: 1,
                height: 32,
                color: AppColors.background,
              ),
              ValueListenableBuilder<List<Boleto>>(
                valueListenable: controller.boletosNotifier,
                builder: (_, boletos, __) => Text.rich(
                  TextSpan(
                    text: "Você tem ",
                    style: TextStyles.captionBackground,
                    children: [
                      TextSpan(
                        text: "${widget.size} boletos\n",
                        style: TextStyles.captionBoldBackground,
                      ),
                      TextSpan(
                        text: "cadastrados para pagar",
                        style: TextStyles.captionBackground,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
