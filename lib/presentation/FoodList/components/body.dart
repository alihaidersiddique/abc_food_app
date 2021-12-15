import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final images = [
    'assets/images/menus/starters/bacon-and-cheese-croquettes.jpeg',
    'assets/images/menus/starters/bacon-and-egg-tarts.jpeg',
    'assets/images/menus/starters/beef-potato-curry-puffs.jpeg',
    'assets/images/menus/starters/brie-and-potato-frittata-bites.jpeg',
    'assets/images/menus/starters/chicken-satay-skewers.jpeg',
    'assets/images/menus/starters/chorizo-croquettes.jpeg',
    'assets/images/menus/starters/ginger-chicken-meatballs.jpeg',
    'assets/images/menus/starters/pappadum-stacks.jpeg',
    'assets/images/menus/starters/pea-haloumi-fritters.jpeg',
    'assets/images/menus/starters/tuna-empanadillas.jpg',
  ];

  final names = [
    'Bacon and cheese croquettes',
    'Bacon and egg tarts',
    'Beef potato curry puffs',
    'Brie and potato frittata bites',
    'Chicken satay skewers',
    'Chorizo croquettes',
    'Ginger chicken meatballs',
    'Pappadum stacks',
    'Pea haloumi fritters',
    'tuna empanadillas',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: names.length,
        staggeredTileBuilder: (int index) => const StaggeredTile.count(2, 4),
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 20.0,
        itemBuilder: (context, index) => buildMenuItem(index),
      ),
    );
  }

  Column buildMenuItem(int index) {
    return Column(
      children: [
        SizedBox(
          width: 45.w,
          height: 30.h,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: const Color(0xff242B2E),
            elevation: 10,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                Image.asset(images[index], height: 29.h, fit: BoxFit.fill),
              ],
            ),
          ),
        ),
        SizedBox(height: 2.h),
        Expanded(
          child: Text(names[index],
              maxLines: 2,
              style: GoogleFonts.poppins(
                  fontSize: 20.0, fontWeight: FontWeight.w600)),
        )
      ],
    );
  }
}
