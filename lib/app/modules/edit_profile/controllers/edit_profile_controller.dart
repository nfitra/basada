import 'package:basada/app/modules/edit_profile/providers/edit_profile_provider.dart';
import 'package:basada/app/modules/profile/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/snackbar.dart';

class EditProfileController extends GetxController with StateMixin {
  GetStorage box = GetStorage();
  final txtNamaController = TextEditingController();
  final txtdateOfBirthController = TextEditingController();
  final txtAddressController = TextEditingController();
  final txtPhoneController = TextEditingController();
  final txtProvinceController = TextEditingController();
  final txtCityController = TextEditingController();
  final txtPostalCodeController = TextEditingController();

  final profileData = Get.arguments as ProfileModel;

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.empty());
    txtNamaController.text = profileData.nName.toString();
    txtdateOfBirthController.text = profileData.nDob.toString();
    txtAddressController.text = profileData.nAddress.toString();
    txtPhoneController.text = profileData.nContact.toString();
    txtProvinceController.text = profileData.nProvince.toString();
    txtCityController.text = profileData.nCity.toString();
    txtPostalCodeController.text = profileData.nPostcode.toString();
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
      await EditProfileProvider()
          .updateProfile(
        box.read(Routes.TOKEN),
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
          successSnackBar('Edit Profile Success');
          Get.offAllNamed(Routes.HOME);
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
