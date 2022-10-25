import 'package:get/get.dart';

import '../controllers/jenis_sampah_controller.dart';

class JenisSampahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JenisSampahController>(
      () => JenisSampahController(),
    );
  }
}
