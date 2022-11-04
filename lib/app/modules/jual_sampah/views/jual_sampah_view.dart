import 'package:basada/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/jual_sampah_controller.dart';

class JualSampahView extends GetView<JualSampahController> {
  const JualSampahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pilih Kategori Sampah"),
        centerTitle: true,
        backgroundColor: Color(0xff266D05),
      ),
      body: controller.obx(
        (state) => GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1.0,
          ),
          itemCount: controller.kategoriSampah.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(
                  Routes.JENIS_SAMPAH,
                  arguments: controller.kategoriSampah[index].sId,
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "${Routes.BASE_URL}/${controller.kategoriSampah[index].kImage}",
                    height: 80.h,
                    width: 70.w,
                  ),
                  Text(
                    controller.kategoriSampah[index].kName
                        .toString()
                        .capitalizeFirst!,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ],
              ),
            );
          },
        ).paddingSymmetric(vertical: 20.h, horizontal: 10.w),
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
