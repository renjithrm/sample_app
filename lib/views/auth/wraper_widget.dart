import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/controller/user_controller.dart';
import 'package:sample_app/views/auth/login_screen.dart';
import 'package:sample_app/views/auth/sing_in_screen.dart';

class WraperWidget extends StatelessWidget {
  WraperWidget({Key? key}) : super(key: key);
  final _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      id: "toggle",
      builder: (_) {
        return _userController.loginScreen ? LoginScreen() : SingInScreen();
      },
    );
  }
}
