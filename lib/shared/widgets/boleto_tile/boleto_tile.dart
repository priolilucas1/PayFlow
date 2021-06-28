import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/shared/models/boleto.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BoletoTile extends StatelessWidget {
  final Boleto data;
  const BoletoTile({required this.data});

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      child: GestureDetector(
        onTap: () {
          _showModalBottomSheet(context);
        },
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            data.name!,
            style: TextStyles.titleListTile,
          ),
          subtitle: Text(
            "Vence em ${data.dueDate}",
            style: TextStyles.captionBody,
          ),
          trailing: Text.rich(
            TextSpan(
              text: "R\$ ",
              style: TextStyles.trailingRegular,
              children: [
                TextSpan(
                  text: "${data.value!.toStringAsFixed(2)}",
                  style: TextStyles.trailingBold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.grey[400],
                height: 2,
                width: 43,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18, bottom: 20),
                child: Text.rich(
                  TextSpan(
                    text: 'O boleto ',
                    style: TextStyles.trailingRegularModal,
                    children: [
                      TextSpan(
                        text: data.name!,
                        style: TextStyles.trailingBoldModal,
                      ),
                      TextSpan(
                        text: '\nno valor de R\$',
                        style: TextStyles.trailingRegularModal,
                      ),
                      TextSpan(
                        text: ' ${data.value!.toStringAsFixed(2)}',
                        style: TextStyles.trailingBoldModal,
                      ),
                      TextSpan(
                        text: '\nfoi pago?',
                        style: TextStyles.trailingRegularModal,
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[100],
                      side: BorderSide(color: AppColors.stroke),
                      elevation: 0,
                      fixedSize: Size(188, 55),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 42.5,
                        vertical: 19,
                      ),
                      child: Text(
                        'Ainda não',
                        style: TextStyles.buttonGray,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      elevation: 0,
                      fixedSize: Size(188, 55),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 42.5,
                        vertical: 19,
                      ),
                      child: Text(
                        'Sim',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
              ),
              TextButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.red,
                  elevation: 0,
                  fixedSize: Size(200, 60),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      FontAwesomeIcons.trashAlt,
                      color: AppColors.delete,
                      size: 15,
                    ),
                    Text(
                      'Deletar boleto',
                      style: TextStyles.deleteRegular,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
