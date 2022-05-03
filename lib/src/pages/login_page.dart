import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import "package:tcc/src/services/auth_services.dart";
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();

  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;
  bool loading = false;
  String ticket = '';
  String Mensagem = 'Coloque um valor correto!';
  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  readQRCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FFFFFF",
      "Cancelar",
      false,
      ScanMode.QR,
    );
    setState(
      () => ticket = code != '-1' ? code : 'Não Validado',
    );
    if (ticket == 'aHeu1Qj8Po') {
      senha.text = '123456';
      email.text = 'mesa1@gmail.com';

      print("senha igual a " + senha.text);
      print("Email " + email.text);
    }
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        titulo = 'Bem vindo';
        actionButton = 'Entrar';
        toggleButton = 'Ainda não tem conta? Cadastre-se agora.';
      } else {
        titulo = 'Crie sua conta';
        actionButton = 'Cadastrar';
        toggleButton = 'Voltar ao Login.';
      }
    });
  }

  login() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  registrar() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: context.width,
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/tccsenai.appspot.com/o/fundo2.png?alt=media&token=70356d20-7847-452f-9911-b771e8c6c0f6',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 100),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Image(
                      image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/tccsenai.appspot.com/o/logo.png?alt=media&token=ad6c0b69-6b65-403d-9b00-a866756ba1da')),
                ),
                TextButton(
                  onPressed: readQRCode,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 27, 138, 31),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: 100,
                    height: 100,
                    child: const Image(
                      image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/tccsenai.appspot.com/o/qr.png?alt=media&token=1e40e376-5f0e-4e8a-9582-b262eadc1195'),
                      width: 250,
                      height: 200,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: (loading)
                          ? [
                              const Padding(
                                padding: EdgeInsets.all(16),
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ]
                          : [
                              Icon(Icons.check),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  actionButton,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                    ),
                  ),
                ),
              ])),
        ]),
      ),
    );
  }
}
