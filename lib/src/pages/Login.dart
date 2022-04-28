import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

import 'Menu.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({Key? key}) : super(key: key);

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  String ticket = '';

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
    // ignore: avoid_print
    print('VALOR IGUAL A: $ticket');
    if (ticket == 'aHeu1Qj8Po') {
      Navigator.pushNamed(context, '/Menu');
    }
  }

  @override
  Widget build(BuildContext context) {
    botaoAction1() {
      Navigator.pushNamed(context, '/page3');
    }

    return Scaffold(
      body: Container(
        color: const Color(0XFF140E0E),
        child: Stack(children: [
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
            child: Column(children: [
              SizedBox(
                height: context.heightTransformer(reducedBy: 85),
              ),
              Image.asset('assets/logo.png'),
              const SizedBox(
                height: 60,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //  TextButton(onPressed: botaoAction1, child: Container()),
                    //   if (ticket == '9')

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
                          image: AssetImage('assets/qr.png'),
                          width: 250,
                          height: 200,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
