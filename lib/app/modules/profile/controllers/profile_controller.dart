import 'package:basada/app/modules/profile/models/profile_model.dart';
import 'package:basada/app/modules/profile/providers/profile_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
}
