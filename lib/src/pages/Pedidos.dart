import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tcc/src/pages/Login.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import '../services/auth_services.dart';

class Pedido extends StatelessWidget {
  const Pedido({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    botaoAction1() {
      Navigator.pushNamed(context, '/page3');
    }

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(230, 211, 171, 2),
              centerTitle: true,
              title: Image(
                image: AssetImage('assets/logo.png'),
                width: 150,
                height: 50,
              ),
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Image(
                      image: AssetImage('assets/drawer.png'),
                    ),
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    title: Text('Menu Inicial'),
                    leading: Icon(
                      Icons.home,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/Menu');
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.assignment,
                    ),
                    title: Text('Cardápio'),
                    onTap: () {
                      Navigator.pushNamed(context, '/CardapioPage');
                    },
                  ),
                  ListTile(
                    title: Text('Pedido'),
                    leading: Icon(
                      Icons.shopping_basket,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/Pedido');
                    },
                  ),
                  ListTile(
                    title: Text('Sair'),
                    leading: Icon(
                      Icons.exit_to_app,
                    ),
                    onTap: () => exit(0),
                  ),
                ],
              ),
            ),
            body: Padding(
                padding: EdgeInsets.all(12),
                child: Column(children: [
                  Container(
                    child: Image(
                      image: AssetImage('assets/pedido.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: OutlinedButton(
                      onPressed: () => context.read<AuthService>().logout(),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 23, 192, 74),
                        shape: StadiumBorder(),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Finalizar Conta',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ]),
                    ),
                  )
                ]))));
  }
}
