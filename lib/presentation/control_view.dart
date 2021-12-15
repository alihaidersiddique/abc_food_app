import 'package:abc_food_app/business/network_controller.dart';
import 'package:abc_food_app/business/controllers/auth_controller.dart';
import 'package:abc_food_app/business/controllers/control_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widgets/custom_text.dart';

class ControlView extends StatelessWidget {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<AuthViewModel>().user == null
          ? const Center(child: Text('Login Screen'))
          : Get.find<NetworkViewModel>().connectionStatus.value == 1 ||
                  Get.find<NetworkViewModel>().connectionStatus.value == 2
              ? GetBuilder<ControlViewModel>(
                  init: ControlViewModel(),
                  builder: (controller) => Scaffold(
                    body: controller.currentScreen,
                    bottomNavigationBar: const Center(child: Text('Nav Bar')),
                  ),
                )
              : const NoInternetConnection();
    });
  }
}

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            SizedBox(height: 30.h),
            CustomText(
                text: 'No Internet', fontSize: 14, alignment: Alignment.center)
          ],
        ),
      ),
    );
  }
}
