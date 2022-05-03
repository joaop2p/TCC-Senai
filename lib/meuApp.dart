import 'package:flutter/material.dart';

import 'package:tcc/src/widget/check_auth.dart';

void main() => runApp(const tcc());

class tcc extends StatelessWidget {
  const tcc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'QrCode Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: CheckAuth(),
    );
  }
}
