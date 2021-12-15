import 'package:abc_food_app/presentation/FoodList/components/body.dart';
import 'package:flutter/material.dart';

class FoodListScreen extends StatelessWidget {
  const FoodListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        title: const Text('foods list'),
        backgroundColor: const Color(0xff242B2E));
  }
}
