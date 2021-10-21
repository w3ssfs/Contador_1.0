import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 300,
                height: 300,
                child: Icon(
                  Icons.android,
                  size: 210,
                  color: Colors.green,
                ),
              ),
              Container(height: 15),
              Card(
                child:
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (text) {
                          email = text;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: "Email", border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        onChanged: (text) {
                          password = text;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Password", border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 15),
                      RaisedButton(
                        color: Colors.green,
                        onPressed: () {
                          if (email == 'wesleyfranca013@gmail.com' &&
                              password == '123') {
                            Navigator.of(context).pushReplacementNamed('/home');
                          } else {
                            print("incorreto");
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            "Entrar",
                            style: TextStyle(color: Colors.white,),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Tela Login'),
          actions: [CustomSwitch()],
        ),
        body: Stack(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'assets/image/background.jpg',
                  fit: BoxFit.cover,
                )),
            Container(
              color: Colors.black12.withOpacity(0.3),
            ),
            _body(),
          ],
        ));
  }
}
