import 'package:flutter/material.dart';
import 'package:tcc/src/cardapio/screens/home/home.dart';
import 'package:tcc/src/pages/Pedidos.dart';
import 'package:tcc/src/pages/Login.dart';
import 'package:tcc/src/pages/acesso.dart';
import 'package:tcc/src/pages/Menu.dart';
import 'package:tcc/src/pages/teste.dart';
import 'package:tcc/src/widget/check_auth.dart';

void main() => runApp(const tcc());

class tcc extends StatelessWidget {
  const tcc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QrCode Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      routes: {
        '/login': (context) => QRCodePage(),
        '/acesso': (context) => SplashScreen(),
        '/Menu': (context) => Menu(),
        '/CardapioPage': (context) => HomePage(),
        '/Pedido': (context) => Pedido(),
        '/teste': (context) => Teste()
      },
      home: CheckAuth(),
    );
  }
}
