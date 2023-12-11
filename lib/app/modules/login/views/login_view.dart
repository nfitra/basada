import 'package:basada/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../../../utils/custom_theme.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Theme(
      data: CustomTheme.getPrimary(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: [
                          const Text(
                            "LOGIN",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16.0 * 2),
                          Row(
                            children: [
                              const Spacer(),
                              Expanded(
                                flex: 8,
                                child: Image.asset(
                                  "assets/images/basada.jpeg",
                                  height: 200,
                                  width: 100,
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                          const SizedBox(height: 16.0 * 2),
                        ],
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Expanded(
                            flex: 8,
                            child: Form(
                              child: Column(
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: controller.myControllerEmail,
                                    textInputAction: TextInputAction.next,
                                    cursorColor: const Color(0xff3A7E04),
                                    onSaved: (email) {},
                                    decoration: const InputDecoration(
                                      hintText: "Your email",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Icon(Icons.person),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: TextFormField(
                                      textInputAction: TextInputAction.done,
                                      obscureText: true,
                                      controller:
                                          controller.myControllerPassword,
                                      cursorColor: const Color(0xff3A7E04),
                                      decoration: const InputDecoration(
                                        hintText: "Your password",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Icon(Icons.lock),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  Hero(
                                    tag: "login_btn",
                                    child: controller.obx(
                                      (state) => ElevatedButton(
                                        onPressed: () {
                                          controller.userLogin(
                                              controller.myControllerEmail.text,
                                              controller
                                                  .myControllerPassword.text);
                                        },
                                        child: Text(
                                          "Login".toUpperCase(),
                                        ),
                                      ),
                                      onEmpty: ElevatedButton(
                                        onPressed: () {
                                          controller.userLogin(
                                              controller.myControllerEmail.text,
                                              controller
                                                  .myControllerPassword.text);
                                        },
                                        child: Text(
                                          "Login".toUpperCase(),
                                        ),
                                      ),
                                      onError: (error) => ElevatedButton(
                                        onPressed: () {
                                          controller.userLogin(
                                              controller.myControllerEmail.text,
                                              controller
                                                  .myControllerPassword.text);
                                        },
                                        child: Text(
                                          "Login".toUpperCase(),
                                        ),
                                      ),
                                      onLoading: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Text(
                                        "Don’t have an Account ? ",
                                        style:
                                            TextStyle(color: Color(0xff3A7E04)),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes.routeRegister);
                                        },
                                        child: const Text(
                                          "Sign Up",
                                          style: TextStyle(
                                            color: Color(0xff3A7E04),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
