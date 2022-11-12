import 'package:basada/app/modules/history/models/history_model.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class HistoryProvider extends GetConnect {
  Future<List<HistoryModel>> getHistory(String token) async {
    final response = await get(
      "${Routes.BASE_URL}/api/request/nasabah",
      headers: {
        'token': token,
      },
    );
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      final List history = response.body;
      return history.map((history) => HistoryModel.fromJson(history)).toList();
    }
  }
}
