import 'package:basada/app/modules/register/providers/register_provider.dart';
import 'package:basada/app/routes/app_pages.dart';
import 'package:basada/app/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController with StateMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  GetStorage box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.empty());
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  void registerMasyarakat(
    String email,
    String password,
    String confirmPassword,
  ) async {
    change(null, status: RxStatus.loading());
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      errorSnackBar('Please fill all the fields');
      change(null, status: RxStatus.error('Please fill all the fields'));
    } else if (password != confirmPassword) {
      errorSnackBar('Password and Confirm Password must be the same');
      change(null,
          status:
              RxStatus.error('Password and Confirm Password must be the same'));
    } else if (!email.isEmail) {
      errorSnackBar('Email is not valid');
      change(
        null,
        status: RxStatus.error('Email is not valid'),
      );
    } else {
      await RegisterProvider().register(email, password).then(
        (value) {
          change(value, status: RxStatus.success());
          box.write(Routes.REGISTER_TOKEN, value.data?.token);
          Get.offNamed(Routes.REGISTER_NEXT);
          successSnackBar('Silahkan lengkapi data diri anda');
        },
        onError: (error) {
          change(null, status: RxStatus.error(error.toString()));
          errorSnackBar(error.toString());
        },
      );
    }
  }
}
