import 'package:basada/app/modules/home/models/article_model.dart';
import 'package:get/get_connect.dart';

import '../../../routes/app_pages.dart';
import 'package:dio/dio.dart' as dio;

class HomeProvider extends GetConnect {
  final dio.Dio _dio = dio.Dio();

  Future<List<ArticleModel>> getArticle(String token) async {
    final response = await get(
      '${Routes.baseUrl}/api/artikel',
      headers: {
        'token': token,
      },
    );
    if (response.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      final List articles = response.body;
      return articles.map((article) => ArticleModel.fromJson(article)).toList();
    }
  }

  Future<String> addDevice(String token, String registrationId) async {
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
      return 'success';
    } else {
      return Future.error("Gagal menambahkan device");
    }
  }
}
