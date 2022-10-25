import 'package:basada/app/modules/home/models/article_model.dart';
import 'package:get/get_connect.dart';

import '../../../routes/app_pages.dart';

class HomeProvider extends GetConnect {
  Future<List<ArticleModel>> getArticle(String token) async {
    final response = await get(
      '${Routes.BASE_URL}/api/artikel',
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
}
