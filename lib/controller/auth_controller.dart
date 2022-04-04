import 'dart:convert';

import 'package:get/get.dart';
import 'package:sample_app/util/constants/api_link.dart';
import 'package:sample_app/util/service/api_service.dart';
import 'package:sample_app/util/service/shared_preference.dart';

class AuthController extends GetxController {
  final _apiLinks = ApiLinks();
  final _apiServics = ApiServics();

  Future loginController(
      {required String gmail, required String password}) async {
    var loginData = {"email": gmail, "password": password};
    var response = await _apiServics.postData(_apiLinks.LOGIN_URL, loginData);
    if (response == null) return null;
    if (response != null) {
      print(response);
      var jsonResponse = jsonDecode(response);
      SaveId.saveId(jsonResponse["token"]);
      return jsonResponse;
      // print(jsonResponse);
    }
  }

  Future registerController(
      {required String gmail, required String password}) async {
    var loginData = {"email": gmail, "password": password};
    var response =
        await _apiServics.postData(_apiLinks.REGISTER_URL, loginData);
    print(response);
    if (response == null) return null;
    if (response != null) {
      var jsonResponse = jsonDecode(response);
      SaveId.saveId(jsonResponse["token"]);
      print(jsonResponse);
      return jsonResponse;
    }
  }
}
