import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();
  Boleto boletoModel = Boleto();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? 'O nome não pode ser vazio' : null;
  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? 'A data de vencimento não pode ser vazio' : null;
  String? validateValor(double value) =>
      value == 0 ? 'Insira um valor maior que R\$ 0,00' : null;
  String? validateCodigo(String? value) {
    if (value!.isEmpty) {
      return 'O código do boleto não pode ser vazio';
    } else if (value.length < 47) {
      return 'Insira um código de boleto válido';
    } else {
      return null;
    }
  }

  void onChange({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    boletoModel = boletoModel.copyWith(
      name: name,
      dueDate: dueDate,
      value: value,
      barcode: barcode,
    );
  }

  Future<void> saveBoleto() async {
    final instance = await SharedPreferences.getInstance();
    final boletos = instance.getStringList('boletos') ?? <String>[];
    boletos.add(boletoModel.toJson());
    await instance.setStringList('boletos', boletos);
    return;
  }

  Future<void> registerBoleto(BuildContext context) async {
    final form = formKey.currentState;
    if (form!.validate()) {
      Navigator.pop(context);
      return await saveBoleto();
    }
  }
}
