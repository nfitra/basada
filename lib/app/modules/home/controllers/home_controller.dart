import 'package:basada/app/modules/home/models/article_model.dart';
import 'package:basada/app/modules/home/providers/home_provider.dart';
import 'package:basada/app/routes/app_pages.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController with StateMixin {
  GetStorage box = GetStorage();
  final count = 0.obs;
  final List<ArticleModel> articles = <ArticleModel>[].obs;
  final firebaseMessagingToken = FirebaseMessaging.instance.getToken();
  String fcmToken = '';
  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.loading());
    await addDevice();
    await getArticle();
  }

  Future<void> addDevice() async {
    await firebaseMessagingToken.then((value) {
      fcmToken = value.toString();
    });
    await HomeProvider()
        .addDevice(box.read('token'), fcmToken)
        .then((value) => print("Device added"));
  }

  Future<void> getArticle() async {
    change(null, status: RxStatus.loading());
    HomeProvider().getArticle(box.read('token')).then((value) {
      articles.assignAll(value);
      change(value, status: RxStatus.success());
    }).catchError((err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void logout() {
    box.remove(Routes.TOKEN);
    Get.offAllNamed(Routes.LOGIN);
  }

  void increment() => count.value++;
}
