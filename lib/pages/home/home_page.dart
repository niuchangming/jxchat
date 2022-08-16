import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jxchat/pages/home/home_controller.dart';
import 'package:jxchat/utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  HomePageController get controller => Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController(context));

    return GetBuilder(
        global: true,
        init: controller,
        builder: (controller) {
          return Container(
            child: Center(
              child: Text(
                "Home Page",
                style: TextStyle(
                  color: ThemeColors.sharedInstance.theme,
                  fontWeight: FontWeight.w800,
                  fontSize: 20
                ),
              ),
            ),
          );
        }
    );
  }

}