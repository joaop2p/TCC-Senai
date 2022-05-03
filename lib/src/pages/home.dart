import 'package:flutter/material.dart';
import 'package:tcc/src/pages/Menu.dart';
import '../cardapio/screens/home/home.dart';
import 'Pedido2.dart';
import 'config.dart';

void main() => runApp(const Home());

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(230, 211, 171, 2),
          centerTitle: true,
          title: const Image(
            image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/tccsenai.appspot.com/o/logo.png?alt=media&token=ad6c0b69-6b65-403d-9b00-a866756ba1da'),
            width: 150,
            height: 50,
          ),
        ),
        body: PageView(
          controller: pc,
          children: [
            Menu(),
            const FavoritasPage(),
            HomePageCard(),
            ConfiguracoesPage()
          ],
          onPageChanged: setPaginaAtual,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: paginaAtual,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book), label: 'Cardáio'),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_sharp), label: 'Pedido'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Configurações'),
          ],
          onTap: (pagina) {
            pc.animateToPage(
              pagina,
              duration: const Duration(milliseconds: 400),
              curve: Curves.ease,
            );
          },
          backgroundColor: Colors.grey[100],
        ),
      ),
    );
  }
}
