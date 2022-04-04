import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/util/service/shared_preference.dart';
import 'package:sample_app/views/auth/wraper_widget.dart';
import 'package:sample_app/views/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SaveId.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  var token = SaveId.getId();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: token == null ? WraperWidget() : HomeScreen(),
    );
  }
}
