import 'package:basada/app/modules/profile/models/profile_model.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class ProfileProvider extends GetConnect {
  Future<ProfileModel> getProfile(String token) async {
    final response = await get(
      "${Routes.baseUrl}/api/nasabah/profile",
      headers: {
        'token': token,
      },
    );
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return ProfileModel.fromJson(response.body);
    }
  }
}
