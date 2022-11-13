import 'package:basada/app/modules/login/providers/login_provider.dart';
import 'package:basada/app/modules/profile/models/profile_model.dart';
import 'package:basada/app/modules/profile/providers/profile_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../routes/app_pages.dart';

class ProfileController extends GetxController with StateMixin {
  GetStorage box = GetStorage();
  final profileData = ProfileModel().obs;
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.empty());
    getProfile();
  }

  Future<void> getProfile() async {
    change(null, status: RxStatus.loading());
    try {
      final response =
          await ProfileProvider().getProfile(box.read('token')).then((value) {
        profileData.value = value;
        change(value, status: RxStatus.success());
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> launchUrlString(String url) async {
    final urlUri = Uri.parse(url);
    if (!await launchUrl(urlUri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  void logout() {
    LoginProvider()
        .deleteDevice(box.read(Routes.TOKEN), box.read('id_device').toString())
        .then((value) {
      box.remove(Routes.USER_ID);
      box.remove(Routes.ROLE);
      box.remove(Routes.TOKEN);
      Get.offAllNamed(Routes.LOGIN);
    });
  }
}
