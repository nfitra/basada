import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../models/add_device_model.dart';
import '../models/login_model.dart';
import 'package:dio/dio.dart' as dio;

class LoginProvider extends GetConnect {
  final dio.Dio _dio = dio.Dio();

  Future<LoginModel> login(String email, String password) async {
    final response = await post(
      "${Routes.baseUrl}/api/login",
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

  Future<AddDeviceModel> addDevice(String token, String registrationId) async {
    final formData = dio.FormData.fromMap({
      'registration_id': registrationId,
    });
    final response = await _dio.post(
      '${Routes.baseUrl}/api/device',
      data: formData,
      options: dio.Options(
        headers: {
          'token': token,
        },
      ),
    );
    if (response.statusCode == 200) {
      print(response.data);
      return AddDeviceModel.fromJson(response.data);
    } else {
      return Future.error("Gagal menambahkan device");
    }
  }

  Future<String> deleteDevice(String token, String idDevice) async {
    final response = await _dio.delete(
      '${Routes.baseUrl}/api/device/$idDevice',
      options: dio.Options(
        headers: {
          'token': token,
        },
      ),
    );
    if (response.statusCode == 200) {
      return "delete device success";
    } else {
      return Future.error("Gagal menghapus device");
    }
  }
}
