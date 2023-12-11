import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';
import '../../../utils/profile_form_row.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
          fillColor: const Color(0xff3A7E04).withOpacity(0.1),
          iconColor: const Color(0xff3A7E04),
          prefixIconColor: const Color(0xff3A7E04),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Edit Profile'),
          backgroundColor: const Color(0xff266D05),
          elevation: 0,
        ),
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
                      }, onEmpty: Text("Isi Form !")),
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
