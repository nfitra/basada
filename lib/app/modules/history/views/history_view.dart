import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff266D05),
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Penjualan'),
        backgroundColor: const Color(0xff266D05),
      ),
      body: Obx(
        () {
          if (controller.historyList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: controller.historyList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                      isThreeLine: true,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(0),
                          vertical: ScreenUtil().setHeight(0)),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(5.r),
                        child: CachedNetworkImage(
                          imageUrl:
                              "${Routes.BASE_URL}/${controller.historyList[index].rImage!}",
                          width: 50.w,
                          height: 100.h,
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        controller.historyList[index].jenisSampah!
                            .toLowerCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                            color: const Color(0xff266D05)),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.historyList[index].jadwalJemput!,
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                          5.verticalSpace,
                          Text(
                            controller.historyList[index].namaNasabah!
                                .toLowerCase(),
                            style: const TextStyle(color: Color(0xff266D05)),
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.historyList[index].keterangan!,
                            style: TextStyle(fontSize: 9.sp),
                          ),
                        ],
                      )).paddingSymmetric(
                    horizontal: 10.w,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
