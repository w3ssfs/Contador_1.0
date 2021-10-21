import 'package:flutter/material.dart';
import 'package:teste/calc_page.dart';
import 'app_controller.dart';
import 'home_page.dart';
import 'login_page.dart';


class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
                brightness: AppController.instance.isDartTheme
                    ? Brightness.dark
                    : Brightness.light,
                primaryColor: Colors.red),

            initialRoute: '/',
            routes: {
              '/': (context) => LoginPage(),
              '/home': (context) => HomePage(),
              '/calc': (context) => CalcPage(),
            },

          );
        });
  }
}
