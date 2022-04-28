import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/src/cardapio/screens/home/home.dart';
import 'package:tcc/src/pages/Pedidos.dart';
import 'package:tcc/src/pages/Login.dart';
import 'package:tcc/src/pages/acesso.dart';
import 'package:tcc/src/pages/Menu.dart';
import 'package:tcc/src/pages/teste.dart';
import 'package:tcc/src/auth/login/trava.dart';
import 'package:tcc/src/services/auth_services.dart';

import 'firebase_options.dart';
import 'meuApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        // ChangeNotifierProvider(create: (context) => ContaRepository()),
        // ChangeNotifierProvider(create: (context) => AppSettings()),
        // ChangeNotifierProvider(
        //   create: (context) => FavoritasRepository(
        //     auth: context.read<AuthService>(),
        // ),
        // ),
      ],
      child: tcc(),
    ),
  );
}

// class tcc extends StatelessWidget {
//   const tcc({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'QrCode Demo',
//       debugShowCheckedModeBanner: false,
//       themeMode: ThemeMode.dark,
//       routes: {
//         '/login': (context) => QRCodePage(),
//         '/acesso': (context) => SplashScreen(),
//         '/Menu': (context) => Menu(),
//         '/CardapioPage': (context) => HomePage(),
//         '/Pedido': (context) => Pedido(),
//         '/teste': (context) => Teste(),
//         '/loginDev': (context) => Login()
//       },
//       initialRoute: '/acesso',
//     );
//   }
// }
