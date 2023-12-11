import 'package:get/get.dart';

import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/form_jual/bindings/form_jual_binding.dart';
import '../modules/form_jual/views/form_jual_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
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
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/register_next/bindings/register_next_binding.dart';
import '../modules/register_next/views/register_next_view.dart';
import '../modules/searchmap/bindings/searchmap_binding.dart';
import '../modules/searchmap/views/searchmap_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.routeLogin;

  static final routes = [
    GetPage(
      name: _Paths.routeHome,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.routeLogin,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.routeRegister,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.routeRegisterNext,
      page: () => const RegisterNextView(),
      binding: RegisterNextBinding(),
    ),
    GetPage(
      name: _Paths.routeJenisSampah,
      page: () => const JenisSampahView(),
      binding: JenisSampahBinding(),
    ),
    GetPage(
      name: _Paths.routeKategoriSampah,
      page: () => const KategoriSampahView(),
      binding: KategoriSampahBinding(),
    ),
    GetPage(
      name: _Paths.routeJualSampah,
      page: () => const JualSampahView(),
      binding: JualSampahBinding(),
    ),
    GetPage(
      name: _Paths.routeFormJual,
      page: () => const FormJualView(),
      binding: FormJualBinding(),
    ),
    GetPage(
      name: _Paths.routeSearchMap,
      page: () => const SearchmapView(),
      binding: SearchmapBinding(),
    ),
    GetPage(
      name: _Paths.routeProfile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.routeHistory,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.routeEditProfile,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
  ];
}
