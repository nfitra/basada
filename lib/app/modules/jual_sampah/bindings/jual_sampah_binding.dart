import 'package:get/get.dart';

import '../controllers/jual_sampah_controller.dart';

class JualSampahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JualSampahController>(
      () => JualSampahController(),
    );
  }
}
