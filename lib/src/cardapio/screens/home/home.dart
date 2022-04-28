import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tcc/src/cardapio/constants/colors.dart';
import 'package:tcc/src/cardapio/models/restaurant.dart';
import 'package:tcc/src/cardapio/screens/home/widget/food_list.dart';
import 'package:tcc/src/cardapio/screens/home/widget/food_list_view.dart';
import 'package:tcc/src/cardapio/screens/home/widget/restaurant_info.dart';
import 'package:tcc/src/cardapio/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selected = 0;
  final pageController = PageController();
  final restaurant = Restaurant.generateRestaurant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(230, 211, 171, 2),
        centerTitle: true,
        title: Image(
          image: const AssetImage('assets/logo.png'),
          width: 150,
          height: 50,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image(
                image: AssetImage('assets/drawer.png'),
              ),
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Menu Inicial'),
              leading: Icon(
                Icons.home,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/Menu');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.assignment,
              ),
              title: Text('Cardápio'),
              onTap: () {
                Navigator.pushNamed(context, '/CardapioPage');
              },
            ),
            ListTile(
              title: Text('Pedido'),
              leading: Icon(
                Icons.shopping_basket,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/Pedido');
              },
            ),
            ListTile(
              title: Text('Sair'),
              leading: Icon(
                Icons.exit_to_app,
              ),
              onTap: () => exit(0),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RestaurantInfo(),
          FoodList(selected, (int index) {
            setState(() {
              selected = index;
            });
            pageController.jumpToPage(index);
          }, restaurant),
          Expanded(
            child: FoodListView(
              selected,
              (int index) {
                setState(() {
                  selected = index;
                });
              },
              pageController,
              restaurant,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            height: 60,
            child: SmoothPageIndicator(
              controller: pageController,
              count: restaurant.menu.length,
              effect: CustomizableEffect(
                dotDecoration: DotDecoration(
                  width: 8,
                  height: 8,
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                activeDotDecoration: DotDecoration(
                  width: 10,
                  height: 10,
                  color: kBackground,
                  borderRadius: BorderRadius.circular(10),
                  dotBorder: DotBorder(
                    color: kPrymaryColor,
                    padding: 2,
                    width: 2,
                  ),
                ),
              ),
              onDotClicked: (index) => pageController.jumpToPage(index),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrymaryColor,
        elevation: 2,
        child: Icon(
          Icons.shopping_bag_outlined,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }
}
