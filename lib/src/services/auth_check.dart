import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/src/pages/Login.dart';
import 'package:tcc/src/pages/Menu.dart';
import 'package:tcc/src/pages/Pedidos.dart';
import 'package:tcc/src/services/auth_services.dart';

import '../pages/acesso.dart';
import '../pages/login_page.dart';

class AuthCheck extends StatefulWidget {
  AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading)
      return loading();
    else if (auth.usuario == null)
      return SplashScreen();
    else
      return Menu();
  }

  loading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
