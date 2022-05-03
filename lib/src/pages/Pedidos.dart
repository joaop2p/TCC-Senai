import 'package:get/get.dart';
import 'package:provider/provider.dart';

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
