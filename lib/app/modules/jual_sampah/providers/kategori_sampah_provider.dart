import 'dart:async';

import 'package:basada/app/modules/jual_sampah/models/kategori_sampah_model.dart';
import 'package:dio/dio.dart';
import '../../../routes/app_pages.dart';

class KategoriSampahProvider {
  Future<List<KategoriSampahModel>> getJenisSampah(String token) async {
    var dio = Dio();
    final response = await dio
        .get(
      "${Routes.baseUrl}/api/kategori-sampah",
      options: Options(
        headers: {
          'token': token,
        },
      ),
    )
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw TimeoutException("Request Timeout");
      },
    );
    if (response.statusCode != 200) {
      return Future.error(response.toString());
    } else {
      final List jenisSampah = response.data;
      return jenisSampah
          .map((jenis) => KategoriSampahModel.fromJson(jenis))
          .toList();
    }
  }
}
