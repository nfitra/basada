import 'package:basada/app/modules/register_next/providers/register_next_provider.dart';
import 'package:basada/app/routes/app_pages.dart';
import 'package:basada/app/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterNextController extends GetxController with StateMixin {
  GetStorage box = GetStorage();
  final txtNamaController = TextEditingController();
  final txtdateOfBirthController = TextEditingController();
  final txtAddressController = TextEditingController();
  final txtPhoneController = TextEditingController();
  final txtProvinceController = TextEditingController();
  final txtCityController = TextEditingController();
  final txtPostalCodeController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.empty());
  }

  @override
  void dispose() {
    super.dispose();
    txtNamaController.dispose();
    txtdateOfBirthController.dispose();
    txtAddressController.dispose();
    txtPhoneController.dispose();
    txtProvinceController.dispose();
    txtCityController.dispose();
    txtPostalCodeController.dispose();
  }

  void registerNext(
    String name,
    String dateOfBirth,
    String address,
    String province,
    String city,
    String postalCode,
    String phoneNumber,
  ) async {
    change(null, status: RxStatus.loading());
    if (name.isEmpty ||
        dateOfBirth.isEmpty ||
        address.isEmpty ||
        province.isEmpty ||
        city.isEmpty ||
        postalCode.isEmpty ||
        phoneNumber.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all the fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      await RegisterNextProvider()
          .updateProfile(
        box.read(Routes.registerToken),
        name,
        dateOfBirth,
        address,
        province,
        city,
        postalCode,
        phoneNumber,
      )
          .then(
        (value) {
          change(value, status: RxStatus.success());
          successSnackBar('Register Success');
          box.remove(Routes.registerToken);
          Get.offAllNamed(Routes.routeLogin);
        },
        onError: (error) {
          change(null, status: RxStatus.error(error.toString()));
          Get.snackbar(
            'Error',
            error.toString(),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        },
      );
    }
  }
}
