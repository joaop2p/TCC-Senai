import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart ';
import 'package:scoped_model/scoped_model.dart';

class Mesa extends StatefulWidget {
  //late final String id;
  @override
  _MesaState createState() => _MesaState();
}

class _MesaState extends State<Mesa> {
  var cardText = TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
  var carregando = false;
  var dados;
  var id, chave;
  var buscar;

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    _listardados();
  }

  _listardados() async {
    var response = await http
        .get(Uri.parse('http://192.168.0.103/flutter/mesas/mesa.php'));
    final map = json.decode(response.body);
    final itens = map["result"];
    this.dados = itens;
    print(itens);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        child: Stack(children: <Widget>[
          Container(
            height: 600,
            width: 350,
            child: new ListView.builder(
                itemCount: this.dados != null ? this.dados.length : 0,
                itemBuilder: (context, i) {
                  final item = this.dados[i];
                  print(item);
                  return new Container(
                      margin: EdgeInsets.only(bottom: 7.0),
                      child: Stack(children: <Widget>[
                        Container(child: Text('Mesa')
                            // Image(
                            //       image: AssetImage('assets/' + item['nome']),
                            //       fit: BoxFit.cover,
                            //     ),
                            //   ),
                            //   Positioned(
                            //       left: 0.0,
                            //       bottom: 0.0,
                            //       width: 350.0,
                            //       height: 60.0,
                            //       child: Container(
                            //         decoration: BoxDecoration(
                            //             gradient: LinearGradient(
                            //                 begin: Alignment.bottomCenter,
                            //                 end: Alignment.topCenter,
                            //                 colors: [Colors.black, Colors.black12])),
                            //       )),
                            //   Positioned(
                            //       left: 10.0,
                            //       bottom: 10.0,
                            //       right: 10.0,
                            //       child: Row(
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.spaceBetween,
                            //           children: <Widget>[
                            //             Column(
                            //                 crossAxisAlignment:
                            //                     CrossAxisAlignment.start,
                            //                 children: <Widget>[
                            //                   GestureDetector(
                            //                     onTap: () {
                            //                       print(item['nome']);
                            //                     },
                            //                     child: Text(
                            //                       item['nome'],
                            //                       style: TextStyle(
                            //                           fontSize: 18.0,
                            //                           fontWeight: FontWeight.bold,
                            //                           color: Colors.white),
                            //                     ),
                            //                   )
                            //                 ])
                            //           ]))
                            )
                      ]));
                }),
          ),
        ]));
  }
}
