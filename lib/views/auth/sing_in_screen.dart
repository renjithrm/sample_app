import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:sample_app/controller/auth_controller.dart';
import 'package:sample_app/controller/user_controller.dart';
import 'package:sample_app/util/constants/const.dart';
import 'package:sample_app/views/screens/home_screen.dart';

class SingInScreen extends StatelessWidget {
  SingInScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _userController = Get.find<UserController>();
  final _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Container(
        width: _size.width,
        height: _size.height,
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              formField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  hindText: "Enter email address",
                  validator: MultiValidator([
                    requriedValidation,
                    EmailValidator(errorText: "Enter valid email address"),
                  ]),
                  icon: const Icon(Icons.email)),
              const SizedBox(
                height: 30,
              ),
              formField(
                controller: passwordController,
                validator: requriedValidation,
                hindText: "Enter password",
                icon: const Icon(Icons.lock),
                obscureText: true,
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                width: _size.width * 0.5,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      var response = await _authController.registerController(
                          gmail: emailController.text,
                          password: passwordController.text);
                      if (response != null) {
                        await Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }
                    }
                  },
                  child: const Text("Register"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () {
                    _userController.toggleButton();
                  },
                  child: const Text("Go to Login"))
            ],
          ),
        ),
      ),
    );
  }
}
