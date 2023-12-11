import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/jenis_sampah_controller.dart';

class JenisSampahView extends GetView<JenisSampahController> {
  const JenisSampahView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff266D05),
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Jenis Sampah'),
        backgroundColor: Color(0xff266D05),
      ),
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: controller.jenisSampah.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                if (controller.isKatalog) {
                  Get.toNamed(Routes.routeFormJual, arguments: [
                    controller.jenisSampah[index].sId,
                    controller.idKategori,
                    controller.jenisSampah[index].jName,
                    controller.jenisSampah[index].jPrice,
                  ]);
                }
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: SizedBox(
                      height: 200.h,
                      width: double.infinity,
                      child: Image.network(
                        "${Routes.baseUrl}/${controller.jenisSampah[index].jImage}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 200.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.black.withOpacity(0.0),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: SizedBox(
                      width: 250.w,
                      child: Text(
                        controller.jenisSampah[index].jName.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20.w, vertical: 10.h),
            );
          },
        ),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        onError: (err) => Center(
          child: Text(err.toString()),
        ),
        onEmpty: const Center(
          child: Text('Data Kosong'),
        ),
      ),
    );
  }
}
