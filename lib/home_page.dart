import 'package:flutter/material.dart';

import 'app_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return homePageState();
  }
}

class homePageState extends State<HomePage> {
  int counter = 0;
  String title = "Contador";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                      'https://avatars.githubusercontent.com/u/85897421?v=4'),
                ),
                accountName: Text('Wesley França'),
                accountEmail: Text('wesleyfranca013@gmail.com')),
            ListTile(
              title: Text('Inicio'),
              subtitle: Text('Tela de Inicio'),
              leading: Icon(Icons.home),
              onTap: () {
                print('Onclick');
              },
            ),
            ListTile(
              title: Text('Logout'),
              subtitle: Text('Finalizar sessão'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Home Page'),
        actions: [CustomSwitch()],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ' $title : $counter',
              style: TextStyle(fontSize: 30),
            ),
            Container(
              height: 120,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 90,
                  child: Container(
                      child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (counter > -1 && counter <= 14) {
                          title = "Contador";
                          counter++;
                        } else if (counter >= 14) {
                          title = "Limite Maximo";
                        } else {
                          counter++;
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Adicionar",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    color: Colors.green,
                    textColor: Colors.white,
                  )),
                ),
                SizedBox(
                  height: 90,
                  child: Container(
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          if (counter <= 0) {
                            title = "Limite Atingido";
                            counter = 0;
                          } else {
                            title = "Contador";
                            counter--;
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Remover",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      color: Colors.red,
                      textColor: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: AppController.instance.isDartTheme,
        onChanged: (value) {
          AppController.instance.chanceTheme();
        });
  }
}
