import 'package:basada/app/modules/register/models/register_model.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class RegisterProvider extends GetConnect {
  Future<ResgisterModel> register(String email, String password) async {
    final response = await post(
      "${Routes.baseUrl}/api/signup",
      {
        "email": email,
        "password": password,
      },
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return ResgisterModel.fromJson(response.body);
    }
  }
}
