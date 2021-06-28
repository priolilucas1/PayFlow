import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/bottom_sheet/custom_bottom_sheet.dart';
import 'package:payflow/shared/widgets/set_label_buttons.dart/set_label_buttons.dart';

import 'barcode_scanner_status.dart';

class BarcodeScannerPage extends StatefulWidget {
  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(
          context,
          '/insert_boleto',
          arguments: controller.status.barcode,
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Stack(
          children: [
            ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.showCamera) {
                  return Container(
                    color: Colors.blue,
                    child: controller.cameraController!.buildPreview(),
                  );
                } else {
                  return Container();
                }
              },
            ),
            RotatedBox(
              quarterTurns: 1,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.black,
                  title: Text(
                    'Escaneie o código de barras do boleto',
                    style: TextStyles.buttonBackground,
                  ),
                  leading: BackButton(
                    color: AppColors.background,
                  ),
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: SetLabelButtons(
                  primaryLabel: 'Inserior código do boleto',
                  primaryOnPressed: () {
                    controller.status = BarcodeScannerStatus.error('Error');
                  },
                  secondaryLabel: 'Buscar na galeria',
                  secondaryOnPressed: controller.scanWithImagePicker,
                ),
              ),
            ),
            ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.hasError) {
                  return Align(
                    alignment: Alignment.bottomLeft,
                    child: CustomBottomSheet(
                      title: 'Não foi possível identificar um código de barras',
                      subtitle:
                          'Tente escanear novamente ou digite o código do seu boleto',
                      primaryLabel: 'Escanear novamente',
                      primaryOnPressed: () {
                        controller.scanWithCamera();
                      },
                      secondaryLabel: 'Digitar código',
                      secondaryOnPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed('/insert_boleto');
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ));
  }
}
