import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../providers/login_provider.dart';

class LoginController extends GetxController with StateMixin {
  late GetStorage box;
  late TextEditingController myControllerEmail;
  late TextEditingController myControllerPassword;
  final isPasswordHidden = true.obs;

  final firebaseMessagingToken = FirebaseMessaging.instance.getToken();
  String fcmToken = '';
  @override
  void onInit() {
    super.onInit();
    box = GetStorage();
    change(null, status: RxStatus.empty());
    myControllerEmail = TextEditingController();
    myControllerPassword = TextEditingController();
  }

  Future<void> addDevice() async {
    await firebaseMessagingToken.then((value) {
      fcmToken = value.toString();
    });
    await LoginProvider().addDevice(box.read('token'), fcmToken).then((value) {
      box.write('id_device', value.data?.idDevice);
    });
  }

  Future<void> userLogin(String email, String password) async {
    change(null, status: RxStatus.loading());
    LoginProvider().login(email, password).then(
      (resp) => {
        change(null, status: RxStatus.success()),
        if (box.read(Routes.registerToken) != null)
          {Get.offAllNamed(Routes.routeRegisterNext, arguments: 'login')}
        else
          {
            box.write(Routes.token, resp.data?.token),
            box.write(Routes.userId, resp.data?.email),
            box.write(Routes.role, resp.data?.role),
            addDevice().then(
                (value) => Get.offAllNamed(Routes.routeHome, arguments: 'login'))
          }
      },
      onError: (err) {
        var error = err.toString();
        if (err.toString().contains('401')) {
          error = 'Email atau password salah';
        }
        if (err.toString().contains('404')) {
          error = 'Email atau password salah';
        } else {
          error = 'Error tidak diketahui';
        }
        Get.snackbar(
          'Error',
          error,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(20),
          borderRadius: 10,
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        );
        change(
          null,
          status: RxStatus.error('Terjadi kesalahan, silahkan coba lagi'),
        );
      },
    );
  }
}
