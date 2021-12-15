import 'package:abc_food_app/presentation/Cart/cart_view.dart';
import 'package:abc_food_app/presentation/Home/home_view.dart';
import 'package:abc_food_app/presentation/Cart/cart_view.dart';
import 'package:abc_food_app/presentation/Home/home_view.dart';
import 'package:abc_food_app/presentation/Profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  Widget _currentScreen = HomeView();
  int _navigatorIndex = 0;

  Widget get currentScreen => _currentScreen;

  int get navigatorIndex => _navigatorIndex;

  changeCurrentScreen(int index) {
    _navigatorIndex = index;
    switch (index) {
      case 0:
        _currentScreen = HomeView();
        break;
      case 1:
        _currentScreen = CartView();
        break;
      case 2:
        _currentScreen = ProfileView();
        break;
      default:
    }
  }
}
