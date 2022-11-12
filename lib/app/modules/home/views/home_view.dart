import 'package:basada/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff266D05),
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: .39.sh,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff266D05),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32.r),
                          bottomRight: Radius.circular(32.r),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/waste_separation.png',
                              height: 80.h,
                            ),
                            20.horizontalSpace,
                            SizedBox(
                              height: 80.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Antar Ke Drop-Point",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600)),
                                  Text("Temukan Drop-Point Terdekat!",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp)),
                                ],
                              ),
                            ),
                          ],
                        ).paddingOnly(bottom: 15.h),
                      ),
                    ),
                    Container(
                      height: .27.sh,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32.r),
                          bottomRight: Radius.circular(32.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "BASADA",
                            style: TextStyle(
                              color: const Color(0xff266D05),
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          20.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.JUAL_SAMPAH);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: 5.w,
                                    right: 5.w,
                                    bottom: 20.h,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey[300]!,
                                    ),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/receive_cash.png",
                                        height: 80.h,
                                        width: 80.w,
                                      ),
                                      Text(
                                        "Jual Sampah",
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.HISTORY);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: 5.w,
                                    right: 5.w,
                                    bottom: 20.h,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey[300]!,
                                    ),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/wallet.png",
                                        height: 80.h,
                                        width: 80.w,
                                      ),
                                      Text(
                                        "Riwayat",
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 5.w,
                                  right: 5.w,
                                  bottom: 20.h,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey[300]!,
                                  ),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: GestureDetector(
                                  onTap: () => Get.toNamed(Routes.PROFILE),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/network.png",
                                        height: 80.h,
                                        width: 80.w,
                                      ),
                                      Text(
                                        "Profile",
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ).paddingOnly(left: 32.w, right: 32.w, top: 32.h),
                    ),
                  ],
                ),
                20.verticalSpace,
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Katalog Sampah",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ).paddingOnly(left: 32.w, right: 32.w),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              "assets/images/documents.png",
                              height: 50.h,
                              width: 50.w,
                            ).paddingAll(10.r),
                            Text(
                              "Kertas",
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "assets/images/steel.png",
                              height: 50.h,
                              width: 50.w,
                            ).paddingAll(10.r),
                            Text(
                              "Besi",
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "assets/images/plastic.png",
                              height: 50.h,
                              width: 50.w,
                            ).paddingAll(10.r),
                            Text(
                              "Plastik",
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "assets/images/oil.png",
                              height: 50.h,
                              width: 50.w,
                            ).paddingAll(10.r),
                            Text(
                              "Minyak",
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ).paddingOnly(left: 32.w, right: 32.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              "assets/images/glass.png",
                              height: 50.h,
                              width: 50.w,
                            ).paddingAll(10.r),
                            Text(
                              "Kaca",
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "assets/images/kara.png",
                              height: 50.h,
                              width: 50.w,
                            ).paddingAll(10.r),
                            Text(
                              "Kara",
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "assets/images/steel.png",
                              height: 50.h,
                              width: 50.w,
                            ).paddingAll(10.r),
                            Text(
                              "Logam",
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "assets/images/electronic.png",
                              height: 50.h,
                              width: 50.w,
                            ).paddingAll(10.r),
                            Text(
                              "Elektronik",
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ).paddingOnly(left: 32.w, right: 32.w),
                  ],
                ),
                30.verticalSpace,
                Text(
                  "Artikel",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ).paddingOnly(left: 32.w, right: 32.w),
                10.verticalSpace,
                controller.obx(
                  (state) => SizedBox(
                    height: 200.h,
                    child: ListView.builder(
                      itemCount: controller.articles.length,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(0),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 220.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  topRight: Radius.circular(10.r),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${Routes.BASE_URL}/${controller.articles[index].aFile}",
                                  height: 100.h,
                                  width: 200.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              5.verticalSpace,
                              Text(
                                controller.articles[index].aTitle.toString(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ).paddingOnly(left: 32.w),
                  ),
                  onLoading: const Center(child: CircularProgressIndicator()),
                  onError: (error) => Center(child: Text(error.toString())),
                  onEmpty: const Center(child: Text("Data Kosong")),
                ),

                // ElevatedButton(
                //     onPressed: () {
                //       controller.logout();
                //     },
                //     child: Text('Logout'))
              ],
            ),
          ),
        ));
  }
}
