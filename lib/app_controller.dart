import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier {

  static AppController instance = AppController();

  bool isDartTheme = false;
  chanceTheme(){
    isDartTheme = !isDartTheme;
    notifyListeners();
  }
}
