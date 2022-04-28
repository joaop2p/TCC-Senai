import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/src/pages/acesso.dart';
import 'package:tcc/src/pages/Menu.dart';
import 'package:tcc/src/services/auth_services.dart';

class CheckAuth extends StatefulWidget {
  const CheckAuth({Key? key}) : super(key: key);

  @override
  State<CheckAuth> createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
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
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
