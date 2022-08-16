import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jxchat/pages/login/login_controller.dart';

class LoginPage extends StatelessWidget{

  const LoginPage({Key? key}) : super(key: key);

  LoginController get controller => Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        global: false,
        init: controller,
        builder: (controller) {
          return Container();
        }
    );
  }

}