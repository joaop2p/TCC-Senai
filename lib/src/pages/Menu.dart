import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc/src/widget/pageselector.dart';

void main() => runApp(const Menu());

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    botaoAction1() {
      Navigator.pushNamed(context, '/Teste');
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(230, 211, 171, 2),
          centerTitle: true,
          title: Image(
            image: const AssetImage('assets/logo.png'),
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
                onTap: () {},
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
              ListTile(
                  title: Text('teste'),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Image(
                                image: AssetImage('assets/construcao.png'),
                              ),
                              backgroundColor: Color.fromARGB(255, 37, 35, 35),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              content: Text(
                                "EM CONSTRUÇÃO! Area reservada para teste dos desenvolvedores",
                              ),
                              contentTextStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/loginDev');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      primary: Color.fromARGB(255, 24, 146, 13),
                                    ),
                                    child: Text("Continuar")),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      primary: Color.fromARGB(255, 24, 146, 13),
                                    ),
                                    child: Text("Voltar")),
                              ]);
                        });
                  })
            ],
          ),
        ),
        body: Stack(children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
                width: context.width,
                child: Container(
                    child: PageSelectorExample(),
                    height: 200,
                    color: Color.fromRGBO(34, 30, 30, 1))),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text("AVISO"),
                    titleTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 20),
                    backgroundColor: Color.fromARGB(255, 37, 35, 35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    content: Text(
                      "Deseja Chamar um garçom?",
                    ),
                    contentTextStyle: TextStyle(color: Colors.white),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            primary: Color.fromARGB(255, 24, 146, 13),
                          ),
                          child: Text("")),
                    ]);
              },
            );
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
