import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/controller/home_controller.dart';
import 'package:sample_app/util/service/shared_preference.dart';
import 'package:sample_app/views/auth/wraper_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _homeController = Get.put(HomeController());
  // final id = SaveId.getId();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () async {
                SaveId.delectId();
                await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => WraperWidget()));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        _homeController.data![index].avatar ?? "")),
                title: Text(_homeController.data![index].firstName ?? "error"),
                subtitle: Text(_homeController.data![index].email ?? "error"),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: _homeController.data!.length),
      ),
    );
  }
}
