import 'dart:io';

import 'package:basada/app/modules/form_jual/model/admin_model.dart';
import 'package:basada/app/modules/form_jual/model/jadwal_model.dart';
import 'package:basada/app/routes/app_pages.dart';
import 'package:dio/dio.dart';

class FormJualProvider {
  final dio = Dio();
  Future<List<JadwalModel>> getJadwal(String token) async {
    final response = await dio.get(
      '${Routes.baseUrl}/api/jadwal',
      options: Options(
        headers: {
          'token': token,
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = response.data;
      return data
          .map<JadwalModel>((json) => JadwalModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load Jadwal');
    }
  }

  Future<List<AdminModel>> getAdmin(String token) async {
    final response = await dio.get(
      '${Routes.baseUrl}/api/admin',
      options: Options(
        headers: {
          'token': token,
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = response.data;
      return data.map<AdminModel>((json) => AdminModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Admin');
    }
  }

  Future<String> requestPenjemputanSampah(
      File image,
      String fkGarbage,
      String lat,
      String long,
      String rWeight,
      String fkJadwal,
      String fkAdmin,
      String token) async {
    String fileName = image.path.split('/').last;
    FormData formData = FormData.fromMap({
      "fkGarbage": fkGarbage,
      "lat": lat,
      "long": long,
      "rWeight": rWeight,
      "fkJadwal": fkJadwal,
      "fkAdmin": fkAdmin,
      "r_image": await MultipartFile.fromFile(image.path, filename: fileName),
    });

    final response = await dio
        .post(
          '${Routes.baseUrl}/api/request',
          data: formData,
          options: Options(
            headers: {
              'token': token,
            },
          ),
        )
        .timeout(const Duration(seconds: 30));

    if (response.statusCode == 200) {
      return response.statusMessage.toString();
    } else {
      print(response.data);
      print("gagal nih");
      return "gagal";
    }
  }
}
