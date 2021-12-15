import 'package:flutter/material.dart';
import 'components/body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        title: const Text('Menus'), backgroundColor: const Color(0xff242B2E));
  }
}
