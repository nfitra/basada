import 'package:get/get.dart';

import '../controllers/kategori_sampah_controller.dart';

class KategoriSampahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KategoriSampahController>(
      () => KategoriSampahController(),
    );
  }
}
