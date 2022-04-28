import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    botaoAction2() {
      Navigator.pushNamed(context, '/login');
    }

    return Scaffold(
      body: Container(
        color: const Color(0XFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.width,
                child: Image.asset(
                  'assets/fundo2.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: context.heightTransformer(reducedBy: 85),
                  ),
                  Image.asset('assets/logo.png'),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                      child: Text("ACESSAR"),
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        primary: Color.fromARGB(255, 24, 146, 13),
                      ),
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
                                  backgroundColor:
                                      Color.fromARGB(255, 37, 35, 35),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  content: Text(
                                    "Esse aplicativo se encontra em desenvolvimento e não representa a versão final do aplicativo. Versão do APP (Alfa: 1.0.2)",
                                  ),
                                  contentTextStyle:
                                      TextStyle(color: Colors.white),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: botaoAction2,
                                        style: ElevatedButton.styleFrom(
                                          shape: const StadiumBorder(),
                                          primary:
                                              Color.fromARGB(255, 24, 146, 13),
                                        ),
                                        child: Text("Concordar")),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: const StadiumBorder(),
                                          primary:
                                              Color.fromARGB(255, 24, 146, 13),
                                        ),
                                        child: Text("Recusar")),
                                  ]);
                            });
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
