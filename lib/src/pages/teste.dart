import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Teste extends StatelessWidget {
  Teste({Key? key}) : super(key: key);

  //final mesa = Mesa();

  @override
  Widget build(BuildContext context) {
    botaoAction1() {
      Navigator.pushNamed(context, '');
    }

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(230, 211, 171, 2),
          centerTitle: true,
          title: Text('TESTE')),
      body: ListView(
        padding: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
        children: <Widget>[
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Produtos Mais Vendidos",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("Precionou' pressed");
                },
                child: Text(
                  "Ver Todos",
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
