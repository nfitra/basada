import 'package:basada/app/modules/home/models/article_model.dart';
import 'package:basada/app/modules/home/providers/home_provider.dart';
import 'package:basada/app/routes/app_pages.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController with StateMixin {
  GetStorage box = GetStorage();
  final count = 0.obs;
  final List<ArticleModel> articles = <ArticleModel>[].obs;
  final firebaseMessagingToken = FirebaseMessaging.instance.getToken();
  String fcmToken = '';
  final dataKatalog = <Map<String, dynamic>>[
    {
      "id": "ea6988222a32f1af2ac2fe1353d661f2",
      "name": "Kertas",
      "image": "assets/images/documents.png",
    },
    {
      "id": "35041a633122f57d2cd51cb4ae05f9f7",
      "name": "Besi",
      "image": "assets/images/steel.png",
    },
    {
      "id": "e80ced31182f380d98b1e2533427f1f3",
      "name": "Plastik",
      "image": "assets/images/plastic.png",
    },
    {
      "id": "a74624eb2545db8476c851c96f20f17f",
      "name": "Minyak",
      "image": "assets/images/oil.png",
    },
    {
      "id": "5bbe740b25b16aec1e69919095f067de",
      "name": "Kaca",
      "image": "assets/images/glass.png",
    },
    {
      "id": "e14388a0184cd3bf6cc6e620816e79b3",
      "name": "Kara",
      "image": "assets/images/kara.png",
    },
    {
      "id": "1aea25760cb1f58f7268e3338c1fce24",
      "name": "Logam",
      "image": "assets/images/steel.png",
    },
    {
      "id": "ef762faef5ffd2266981c9891bd8a7b7",
      "name": "Elektronik",
      "image": "assets/images/electronic.png",
    }
  ];

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.loading());
    await getArticle();
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
    box.remove(Routes.token);
    Get.offAllNamed(Routes.routeLogin);
  }

  Future<void> launchUrlString(String url) async {
    final urlUri = Uri.parse(url);
    if (!await launchUrl(urlUri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
