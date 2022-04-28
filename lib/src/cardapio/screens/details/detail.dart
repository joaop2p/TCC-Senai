import 'package:flutter/material.dart';
import 'package:tcc/src/cardapio/constants/colors.dart';
import 'package:tcc/src/cardapio/models/food.dart';
import 'package:tcc/src/cardapio/screens/details/widget/food_detail.dart';
import 'package:tcc/src/cardapio/screens/details/widget/food_img.dart';
import 'package:tcc/src/cardapio/widgets/custom_app_bar.dart';

class DetailPage extends StatelessWidget {
  final Food food;
  DetailPage(this.food);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrymaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              Icons.arrow_back_ios_outlined,
              Icons.favorite_outline,
              leftCallback: () => Navigator.of(context).pop(),
            ),
            FoodImg(food),
            FoodDetail(food),
          ],
        ),
      ),
    );
  }
}
