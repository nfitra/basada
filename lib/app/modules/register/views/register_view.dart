import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';
import '../../../utils/custom_theme.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                          const SizedBox(height: 16.0 * 2),
                          Row(
                            children: [
                              const Spacer(),
                              Expanded(
                                flex: 8,
                                child: Image.asset(
                                  "assets/images/basada.jpeg",
                                  width: 200,
                                  height: 200,
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                          const SizedBox(height: 16.0 * 2),
                          const Text(
                            "Daftarkan Akun",
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                                    textInputAction: TextInputAction.next,
                                    cursorColor: const Color(0xff3A7E04),
                                    controller: controller.emailController,
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
                                      controller: controller.passwordController,
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
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 0),
                                    child: TextFormField(
                                      textInputAction: TextInputAction.done,
                                      obscureText: true,
                                      controller:
                                          controller.confirmPasswordController,
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
                                  controller.obx(
                                    (state) => _buildButton(
                                        controller.emailController.text,
                                        controller.passwordController.text,
                                        controller
                                            .confirmPasswordController.text),
                                    onLoading: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    onError: (error) => _buildButton(
                                        controller.emailController.text,
                                        controller.passwordController.text,
                                        controller
                                            .confirmPasswordController.text),
                                    onEmpty: _buildButton(
                                        controller.emailController.text,
                                        controller.passwordController.text,
                                        controller
                                            .confirmPasswordController.text),
                                  ),
                                  const SizedBox(height: 16.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Text(
                                        "Already have an account? ",
                                        style:
                                            TextStyle(color: Color(0xff3A7E04)),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes.routeLogin);
                                        },
                                        child: const Text(
                                          "Login",
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

  Widget _buildButton(String email, String password, String confirmPassword) {
    return Hero(
      tag: "login_btn",
      child: ElevatedButton(
        onPressed: () {
          controller.registerMasyarakat(email, password, confirmPassword);
        },
        child: Text(
          "Register".toUpperCase(),
        ),
      ),
    );
  }
}
