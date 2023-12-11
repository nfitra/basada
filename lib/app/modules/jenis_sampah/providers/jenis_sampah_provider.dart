import 'package:basada/app/modules/jenis_sampah/models/jenis_sampah_model.dart';
import 'package:get/get_connect.dart';

import '../../../routes/app_pages.dart';

class JenisSampahProvider extends GetConnect {
  Future<List<JenisSampahModel>> getJenisSampah(String token, String id) async {
    final response = await get(
      "${Routes.baseUrl}/api/sampah-by-kategori/$id",
      headers: {
        'token': token,
      },
    );
    if (response.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      final List jenisSampah = response.body;
      return jenisSampah
          .map((jenis) => JenisSampahModel.fromJson(jenis))
          .toList();
    }
  }
}
