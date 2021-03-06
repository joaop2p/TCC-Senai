import 'package:flutter/material.dart';
import 'package:tcc/src/cardapio/constants/colors.dart';
import 'package:tcc/src/cardapio/models/food.dart';
import 'package:tcc/src/cardapio/screens/details/widget/food_quantity.dart';

class FoodDetail extends StatelessWidget {
  final Food food;
  FoodDetail(this.food);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(25),
        color: kBackground,
        child: Column(
          children: [
            Text(
              food.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconText(
                    Icons.access_time_outlined, Colors.blue, food.waitTime),
                _buildIconText(
                    Icons.star_outline, Colors.amber, food.score.toString()),
                _buildIconText(
                    Icons.local_fire_department_outlined, Colors.red, food.cal),
              ],
            ),
            SizedBox(height: 30),
            FoodQuantity(food),
          ],
        ),
      ),
    );
  }

  Widget _buildIconText(IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 20,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
