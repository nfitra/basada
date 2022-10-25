import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../models/login_model.dart';

class LoginProvider extends GetConnect {
  Future<LoginModel> login(String email, String password) async {
    final response = await post(
      "${Routes.BASE_URL}/api/login",
      {
        "email": email,
        "password": password,
      },
    );
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return LoginModel.fromJson(response.body);
    }
  }
}
