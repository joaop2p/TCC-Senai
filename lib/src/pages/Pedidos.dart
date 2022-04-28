import 'package:get/get.dart';
import 'package:tcc/src/pages/Login.dart';
import 'package:flutter/material.dart';
import 'dart:io';

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
        body: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: Column(children: [
              SizedBox(
                height: context.heightTransformer(reducedBy: 85),
              ),
              Image.asset('assets/pedido.png'),
              const SizedBox(
                height: 60,
              ),
            ]),
          ),
          SizedBox(
            height: context.heightTransformer(reducedBy: 100),
          ),
          Align(
            child: ElevatedButton(
                onPressed: botaoAction1,
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  primary: const Color.fromARGB(255, 24, 146, 13),
                  elevation: 6,
                  shadowColor: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: Text(
                    'Finalizar conta',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                )),
          )
        ]),
      ),
    );
  }
}
