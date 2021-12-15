import 'package:abc_food_app/presentation/FoodList/food_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final lst = ['Starters', 'Salads', 'Main Courses', 'Desserts', 'Drinks'];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
            itemCount: lst.length,
            itemBuilder: (context, index) => GestureDetector(
                  child: buildEachMenu(index),
                  onTap: () {
                    Get.to(() => FoodListScreen());
                  },
                )));
  }

  SizedBox buildEachMenu(int index) {
    return SizedBox(
      width: 90.w,
      height: 20.h,
      child: Card(
        color: const Color(0xff242B2E),
        elevation: 1,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(
            child: Text(
          lst[index],
          style: GoogleFonts.poppins(fontSize: 24, color: Colors.white),
        )),
      ),
    );
  }
}
