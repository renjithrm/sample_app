import 'package:get/get.dart';
import 'package:sample_app/model/user_model.dart';
import 'package:sample_app/util/constants/api_link.dart';
import 'package:sample_app/util/service/api_service.dart';

class HomeController extends GetxController {
  final _apiLinks = ApiLinks();
  final _apiServics = ApiServics();

  List<Datum>? data = [];
  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  Future getUserData() async {
    var response = await _apiServics.getRespose(_apiLinks.USER_DATA);
    if (response == null) return null;
    if (response != null) {
      var listUserModel = userModelFromJson(response);
      data = listUserModel.data;
      print(data);
    }
  }
}
