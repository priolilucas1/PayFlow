import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/shared/models/user.dart';

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
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColors.background),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColors.primary),
    );

    return MaterialApp(
        title: 'Pay Flow',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primary,
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => SplashPage(),
          "/home": (context) => HomePage(
                user: ModalRoute.of(context)!.settings.arguments as User,
              ),
          '/login': (context) => LoginPage(),
          '/barcode_scanner': (context) => BarcodeScannerPage(),
          "/insert_boleto": (context) => InsertBoletoPage(
                barcode: ModalRoute.of(context) != null
                    ? ModalRoute.of(context)!.settings.arguments.toString()
                    : null,
              ),
        });
  }
}
