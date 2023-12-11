import 'package:basada/app/modules/jual_sampah/models/kategori_sampah_model.dart';
import 'package:basada/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../providers/kategori_sampah_provider.dart';

class JualSampahController extends GetxController with StateMixin {
  final count = 0.obs;
  GetStorage box = GetStorage();
  final List<KategoriSampahModel> kategoriSampah = <KategoriSampahModel>[].obs;
  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.empty());
    await getKategoriSampah();
  }

  Future<void> getKategoriSampah() async {
    change(null, status: RxStatus.loading());
    KategoriSampahProvider()
        .getJenisSampah(box.read(Routes.token))
        .then((value) {
      kategoriSampah.assignAll(value);
      change(value, status: RxStatus.success());
    }).catchError((err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void increment() => count.value++;
}
