import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto.dart';
import 'package:payflow/shared/widgets/boleto_tile/boleto_tile.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';

class BoletoList extends StatefulWidget {
  final BoletoListController controller;
  BoletoList({Key? key, required this.controller}) : super(key: key);

  @override
  _BoletoListState createState() => _BoletoListState();
}

class _BoletoListState extends State<BoletoList> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<Boleto>>(
      valueListenable: widget.controller.boletosNotifier,
      builder: (_, boletos, __) => Column(
        children: boletos
            .map(
              (e) => BoletoTile(data: e),
            )
            .toList(),
      ),
    );
  }
}
