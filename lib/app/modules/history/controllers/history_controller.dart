import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/history_model.dart';
import '../providers/history_provider.dart';

class HistoryController extends GetxController with StateMixin {
  final historyList = <HistoryModel>[].obs;

  GetStorage box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getHistory();
  }

  Future<void> getHistory() async {
    change(null, status: RxStatus.loading());
    await HistoryProvider().getHistory(box.read('token')).then((value) {
      historyList.assignAll(value);
      change(null, status: RxStatus.success());
    }).catchError((e) {
      change(null, status: RxStatus.error(e.toString()));
    });
  }
}
