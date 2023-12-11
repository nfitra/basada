import 'package:basada/app/modules/jenis_sampah/models/jenis_sampah_model.dart';
import 'package:basada/app/modules/jenis_sampah/providers/jenis_sampah_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class JenisSampahController extends GetxController with StateMixin {
  GetStorage box = GetStorage();
  final idKategori = Get.arguments.toString();
  var isKatalog = false;
  final count = 0.obs;
  final List<JenisSampahModel> jenisSampah = <JenisSampahModel>[].obs;
  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.empty());
    isKatalog = Get.parameters['name'] == null;
    await getJenisSampah();
  }

  Future<void> getJenisSampah() async {
    change(null, status: RxStatus.loading());
    JenisSampahProvider()
        .getJenisSampah(box.read('token'), idKategori)
        .then((value) {
      jenisSampah.assignAll(value);
      change(value, status: RxStatus.success());
    }).catchError((err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void increment() => count.value++;
}
