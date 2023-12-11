import 'package:get/get_connect.dart';

import '../../../routes/app_pages.dart';

class RegisterNextProvider extends GetConnect {
  Future<String> updateProfile(
    String token,
    String name,
    String dateOfBirth,
    String address,
    String province,
    String city,
    String postalCode,
    String phoneNumber,
  ) async {
    final response = await put(
      "${Routes.baseUrl}/api/nasabah",
      {
        "nama": name,
        "tanggal_lahir": dateOfBirth,
        "alamat": address,
        "provinsi": province,
        "kota": city,
        "kode_pos": postalCode,
        "telepon": phoneNumber,
      },
      headers: {
        "Content-Type": "application/json",
        "token": token,
      },
    );
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return "success";
    }
  }
}
