import 'package:get/get.dart';

class UserController extends GetxController {
  var loginScreen = true;

  toggleButton() {
    loginScreen = !loginScreen;
    update(["toggle"]);
  }
}
