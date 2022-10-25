import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jenis_sampah/bindings/jenis_sampah_binding.dart';
import '../modules/jenis_sampah/views/jenis_sampah_view.dart';
import '../modules/jual_sampah/bindings/jual_sampah_binding.dart';
import '../modules/jual_sampah/views/jual_sampah_view.dart';
import '../modules/kategori_sampah/bindings/kategori_sampah_binding.dart';
import '../modules/kategori_sampah/views/kategori_sampah_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/register_next/bindings/register_next_binding.dart';
import '../modules/register_next/views/register_next_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_NEXT,
      page: () => const RegisterNextView(),
      binding: RegisterNextBinding(),
    ),
    GetPage(
      name: _Paths.JENIS_SAMPAH,
      page: () => const JenisSampahView(),
      binding: JenisSampahBinding(),
    ),
    GetPage(
      name: _Paths.KATEGORI_SAMPAH,
      page: () => const KategoriSampahView(),
      binding: KategoriSampahBinding(),
    ),
    GetPage(
      name: _Paths.JUAL_SAMPAH,
      page: () => const JualSampahView(),
      binding: JualSampahBinding(),
    ),
  ];
}
