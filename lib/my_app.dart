import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_page.dart';

import 'modules/login/login_page.dart';
import 'shared/themes/app_colors.dart';
import 'modules/splash/splash_page.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_page.dart';

class MyApp extends StatelessWidget {
  MyApp() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PayFlow',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primary,
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => SplashPage(),
          '/home': (context) => HomePage(),
          '/login': (context) => LoginPage(),
          '/barcode_scanner': (context) => BarcodeScannerPage(),
          '/insert_boleto': (context) => InsertBoletoPage(),
        });
  }
}
