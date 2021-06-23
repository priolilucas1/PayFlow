import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  var currentPage = 0;

  void setPage(int index) {
    currentPage = index;
  }
}
