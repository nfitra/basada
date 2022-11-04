import 'package:get/get.dart';

import '../controllers/form_jual_controller.dart';

class FormJualBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormJualController>(
      () => FormJualController(),
    );
  }
}
