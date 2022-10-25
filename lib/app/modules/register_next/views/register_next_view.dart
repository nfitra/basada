import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/register_next_controller.dart';

class RegisterNextView extends GetView<RegisterNextController> {
  const RegisterNextView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(controller.box.read('register_token'));
    return Theme(
      data: ThemeData(
        primaryColor: const Color(0xff3A7E04),
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xff3A7E04),
            shape: const StadiumBorder(),
            maximumSize: const Size(double.infinity, 56),
            minimumSize: const Size(double.infinity, 56),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xff3A7E04).withOpacity(0.1),
          iconColor: Color(0xff3A7E04),
          prefixIconColor: Color(0xff3A7E04),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
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
                                    controller: controller.txtNamaController,
                                    decoration: const InputDecoration(
                                      hintText: "Nama Lengkap",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Icon(Icons.person),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    textInputAction: TextInputAction.done,
                                    controller:
                                        controller.txtdateOfBirthController,
                                    cursorColor: const Color(0xff3A7E04),
                                    decoration: const InputDecoration(
                                      hintText: "Tanggal Lahir",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Icon(Icons.lock),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    textInputAction: TextInputAction.done,
                                    controller: controller.txtAddressController,
                                    cursorColor: const Color(0xff3A7E04),
                                    decoration: const InputDecoration(
                                      hintText: "Alamat",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Icon(Icons.lock),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    textInputAction: TextInputAction.done,
                                    controller:
                                        controller.txtProvinceController,
                                    cursorColor: const Color(0xff3A7E04),
                                    decoration: const InputDecoration(
                                      hintText: "Provinsi",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Icon(Icons.lock),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    textInputAction: TextInputAction.done,
                                    controller: controller.txtCityController,
                                    cursorColor: const Color(0xff3A7E04),
                                    decoration: const InputDecoration(
                                      hintText: "Kota",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Icon(Icons.lock),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    textInputAction: TextInputAction.done,
                                    controller:
                                        controller.txtPostalCodeController,
                                    cursorColor: const Color(0xff3A7E04),
                                    decoration: const InputDecoration(
                                      hintText: "Kode Pos",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Icon(Icons.lock),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    textInputAction: TextInputAction.done,
                                    controller: controller.txtPhoneController,
                                    cursorColor: const Color(0xff3A7E04),
                                    decoration: const InputDecoration(
                                      hintText: "Telepon",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Icon(Icons.lock),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  controller.obx(
                                    (state) => buildButton(
                                      controller.txtNamaController.text,
                                      controller.txtdateOfBirthController.text,
                                      controller.txtAddressController.text,
                                      controller.txtProvinceController.text,
                                      controller.txtCityController.text,
                                      controller.txtPostalCodeController.text,
                                      controller.txtPhoneController.text,
                                    ),
                                    onLoading: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    onError: (error) => buildButton(
                                      controller.txtNamaController.text,
                                      controller.txtdateOfBirthController.text,
                                      controller.txtAddressController.text,
                                      controller.txtProvinceController.text,
                                      controller.txtCityController.text,
                                      controller.txtPostalCodeController.text,
                                      controller.txtPhoneController.text,
                                    ),
                                    onEmpty: buildButton(
                                      controller.txtNamaController.text,
                                      controller.txtdateOfBirthController.text,
                                      controller.txtAddressController.text,
                                      controller.txtProvinceController.text,
                                      controller.txtCityController.text,
                                      controller.txtPostalCodeController.text,
                                      controller.txtPhoneController.text,
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
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

  Widget buildButton(
    String name,
    String dateOfBirth,
    String address,
    String province,
    String city,
    String postalCode,
    String phoneNumber,
  ) {
    return Hero(
      tag: "login_btn",
      child: ElevatedButton(
        onPressed: () {
          controller.registerNext(
            name,
            dateOfBirth,
            address,
            province,
            city,
            postalCode,
            phoneNumber,
          );
        },
        child: Text(
          "Selesai".toUpperCase(),
        ),
      ),
    );
  }
}
