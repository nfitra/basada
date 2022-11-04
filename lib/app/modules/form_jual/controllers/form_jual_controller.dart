import 'dart:convert';
import 'dart:io';

import 'package:basada/app/modules/form_jual/model/admin_model.dart';
import 'package:basada/app/modules/form_jual/model/jadwal_model.dart';
import 'package:basada/app/modules/form_jual/providers/form_jual_providers.dart';
import 'package:basada/app/routes/app_pages.dart';
import 'package:basada/app/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class FormJualController extends GetxController with StateMixin {
  final latlng = "".obs;
  final page = 0.obs;
  final isChecked = false.obs;
  LatLng geometry = const LatLng(0, 0);
  final dataSampah = Get.arguments;

  final List<JadwalModel> jadwalPenjemputan = <JadwalModel>[].obs;
  final List<AdminModel> admin = <AdminModel>[].obs;

  RxString selectedImagePath = ''.obs;
  RxString selectedImageSize = ''.obs;
  GetStorage box = GetStorage();

  RxString bytes64Image = ''.obs;

  final selectedJadwalId = ''.obs;
  final selectedJadwal = 'Pilih Jadwal'.obs;
  final selectedAdminId = ''.obs;
  final selectedAdmin = 'Pilih Admin'.obs;
  final beratSampahController = TextEditingController();
  final fileImage = File('').obs;

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.empty());
    await getJadwal();
    await getAdmin();
  }

  Future<void> getImage(
    RxString selectedImagePath,
    RxString selectedImageSize,
    RxString bytes64Image,
  ) async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImagePath.value = pickedFile.path;
        selectedImageSize.value =
            '${(File(selectedImagePath.value).lengthSync() / 1024 / 1024).toStringAsFixed(2)} Mb';

        final bytes = File(selectedImagePath.value).readAsBytesSync();
        bytes64Image.value = base64Encode(bytes);
        fileImage.value = File(selectedImagePath.value);
      } else {
        errorSnackBar("Gagal mengambil gambar!");
      }
    } catch (e) {
      errorSnackBar("Terjadi kesalahan saat mengambil gambar!");
    }
  }

  Future<void> getJadwal() async {
    change(null, status: RxStatus.loading());
    FormJualProvider().getJadwal(box.read(Routes.TOKEN)).then(
      (value) {
        jadwalPenjemputan.assignAll(value);
        selectedJadwalId.value = jadwalPenjemputan[0].sId.toString();
        selectedJadwal.value =
            '${jadwalPenjemputan[0].sDay} ${jadwalPenjemputan[0].sTime}';
        change(value, status: RxStatus.success());
      },
    ).catchError(
      (err) {
        change(null, status: RxStatus.error(err.toString()));
      },
    );
  }

  Future<void> getAdmin() async {
    change(null, status: RxStatus.loading());
    FormJualProvider().getAdmin(box.read(Routes.TOKEN)).then(
      (value) {
        admin.assignAll(value);
        selectedAdminId.value = value[0].sId.toString();
        selectedAdmin.value = value[0].unName.toString();
        change(value, status: RxStatus.success());
      },
    ).catchError(
      (err) {
        change(null, status: RxStatus.error(err.toString()));
      },
    );
  }

  Future<void> jualSampah(
    File image,
    String fk_garbage,
    String lat,
    String long,
    String r_weight,
    String fk_jadwal,
    String fk_admin,
  ) async {
    change(null, status: RxStatus.loading());
    FormJualProvider()
        .requestPenjemputanSampah(image, fk_garbage, lat, long, r_weight,
            fk_jadwal, fk_admin, box.read(Routes.TOKEN))
        .then(
      (value) {
        change(value, status: RxStatus.success());
        successSnackBar("Berhasil mengajukan penjemputan sampah!");
        Get.offAllNamed(Routes.HOME);
      },
    ).catchError(
      (err) {
        print(err);
        change(null, status: RxStatus.error(err.toString()));
      },
    );
  }
}
