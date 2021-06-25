import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoletoListController {
  final boletosNotifier = ValueNotifier<List<Boleto>>(<Boleto>[]);

  List<Boleto> get boletos => boletosNotifier.value;
  set boletos(List<Boleto> value) => boletosNotifier.value = value;

  BoletoListController() {
    getBoletos();
  }

  void getBoletos() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList("boletos");
      boletos = response!.map((e) => Boleto.fromJson(e)).toList();
    } catch (e) {}
  }

  void dispose() {
    boletosNotifier.dispose();
  }
}
