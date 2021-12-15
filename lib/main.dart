import 'package:abc_food_app/helper/bindings.dart';
import 'package:abc_food_app/presentation/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => ScreenUtilInit(
        builder: () => GetMaterialApp(
          initialBinding: Binding(),
          home: const ControlView(),
          debugShowCheckedModeBanner: false,
          title: 'ABC Food App',
        ),
        designSize: orientation == Orientation.portrait
            ? const Size(375, 812)
            : const Size(812, 375),
      ),
    );
  }
}
