// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(Login());

class Login extends StatelessWidget {
  final TextEditingController _controladorSenha = TextEditingController();
  final TextEditingController _controladorTeste = TextEditingController();
  final String _gg = '2';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Area de testes (Banco de dados)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controladorSenha,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Senha Dev",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  )),
            ),
            RaisedButton(
              child: Text('Login'),
              onPressed: () {
                final String Senha = _controladorSenha.text;
                if (Senha == '531493') {
                  Navigator.pushNamed(context, '/teste');
                }
              },
            )
          ],
        ),
      ),
    ));
  }
}

class Produto {
  final String Senha;
  Produto(this.Senha);
  @override
  String toString() {
    return 'Produto{nome: $Senha}';
  }
}
