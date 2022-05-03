import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tcc/src/widget/pageselector.dart';
import '../services/auth_services.dart';

void main() => runApp(Menu());

class Menu extends StatelessWidget {
  Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          Stack(children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                  width: context.width,
                  child: Container(
                      child: const PageSelectorExample(),
                      height: 200,
                      color: Color.fromRGBO(34, 30, 30, 1))),
            ),
          ]),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: OutlinedButton(
              onPressed: () => context.read<AuthService>().logout(),
              style: OutlinedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Sair do App',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),

        // backgroundColor: Colors.grey[100],

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
