import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_next_controller.dart';
import '../../../utils/profile_form_row.dart';

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
                      ProfileFormRow(
                        namaController: controller.txtNamaController,
                        dateOfBirthController:
                            controller.txtdateOfBirthController,
                        addressController: controller.txtAddressController,
                        provinceController: controller.txtProvinceController,
                        cityController: controller.txtCityController,
                        postalCodeController:
                            controller.txtPostalCodeController,
                        phoneController: controller.txtPhoneController,
                        onButtonPressed: (nama, dateOfBirth, address, province,
                            city, postalCode, phone) {
                          controller.registerNext(nama, dateOfBirth, address,
                              province, city, postalCode, phone);
                        },
                      ),
                      controller.obx(
                        (state) =>
                            const Center(child: CircularProgressIndicator()),
                        onLoading:
                            const Center(child: CircularProgressIndicator()),
                        onError: (error) {
                          // Handle error here
                          return const Text("Terjadi Kesalahan");
                        },
                        onEmpty: Text("Isi Form !")
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
