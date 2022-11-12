import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/colors.dart';
import '../../../utils/rounded_button.dart';
import '../../../utils/text_default.dart';
import '../controllers/form_jual_controller.dart';

class FormJualView extends GetView<FormJualController> {
  const FormJualView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double kItemExtent = 32.0;
    const List<String> fruitNames = <String>[
      'Apple',
      'Mango',
      'Banana',
      'Orange',
      'Pineapple',
      'Strawberry',
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 5,
        title: TextSemiBold(
          text: 'Jual Sampah',
          fontSize: ScreenUtil().setSp(18),
          textColour: white,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Obx(
            () => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.w),
                border: Border.all(
                  color: Colors.grey,
                  width: .1.w,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15.r,
                    offset: Offset(0, 10.w),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.verticalSpace,
                  Container(
                    width: 1.sw,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.w),
                      border: Border.all(
                        color: Colors.grey,
                        width: .1.w,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15.r,
                          offset: Offset(0, 10.w),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextBold(
                          text: "${controller.dataSampah[2]}",
                          fontSize: 12.sp,
                        ),
                        SizedBox(height: 10.h),
                        TextBold(
                          text: "Rp ${controller.dataSampah[3]} / KG",
                          fontSize: 32.sp,
                        ),
                      ],
                    ).paddingAll(20.r),
                  ),
                  10.verticalSpace,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.w),
                      border: Border.all(
                        color: Colors.grey,
                        width: .1.w,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15.r,
                          offset: Offset(0, 10.w),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBold(
                          text: "Pilih foto sampah",
                          fontSize: 14.sp,
                        ),
                        SizedBox(height: 10.h),
                        if (controller.bytes64Image.value.isEmpty)
                          const SizedBox()
                        else
                          Center(
                            child: Container(
                              height: Get.width / 2,
                              width: Get.width / 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.w),
                                image: DecorationImage(
                                  image: MemoryImage(
                                    base64Decode(controller.bytes64Image.value),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.getImage(
                                    controller.selectedImagePath,
                                    controller.selectedImageSize,
                                    controller.bytes64Image);
                              },
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.image,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 10.w),
                                  TextLight(
                                    text: "Gallery",
                                    fontSize: 12.sp,
                                  ),
                                ],
                              ),
                            ),
                            if (controller.bytes64Image.value.isNotEmpty)
                              GestureDetector(
                                onTap: () {
                                  controller.bytes64Image.value = '';
                                },
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.delete,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 10.w),
                                    TextLight(
                                      text: "Hapus",
                                      fontSize: 12.sp,
                                    ),
                                  ],
                                ),
                              )
                            else
                              const SizedBox(),
                          ],
                        ),
                      ],
                    ).paddingAll(20.r),
                  ),
                  10.verticalSpace,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.w),
                      border: Border.all(
                        color: Colors.grey,
                        width: .1.w,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15.r,
                          offset: Offset(0, 10.w),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBold(
                          text: "Berat Sampah (Minimal 1.4 Kg)",
                          fontSize: 14.sp,
                        ),
                        SizedBox(height: 10.h),
                        TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          controller: controller.beratSampahController,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9.]')),
                          ],
                          decoration: InputDecoration(
                            hintText: "Masukan berat sampah",
                            hintStyle: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(10.w),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(10.w),
                            ),
                          ),
                        ),
                      ],
                    ).paddingAll(20.r),
                  ),
                  10.verticalSpace,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.w),
                      border: Border.all(
                        color: Colors.grey,
                        width: .1.w,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15.r,
                          offset: Offset(0, 10.w),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBold(
                          text: "Pilih lokasi",
                          fontSize: 14.sp,
                        ),
                        SizedBox(height: 10.h),
                        selectLocation(),
                      ],
                    ).paddingAll(20.r),
                  ),
                  10.verticalSpace,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.w),
                      border: Border.all(
                        color: Colors.grey,
                        width: .1.w,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15.r,
                          offset: Offset(0, 10.w),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBold(
                          text: "Pilih Admin",
                          fontSize: 14.sp,
                        ),
                        SizedBox(height: 10.h),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(374.w, 50.h),
                            backgroundColor: primary,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                          ),
                          onPressed: () => _showDialog(
                            CupertinoPicker(
                              magnification: 1.22,
                              squeeze: 1.2,
                              useMagnifier: true,
                              itemExtent: kItemExtent,
                              onSelectedItemChanged: (int selectedItem) {
                                controller.selectedAdmin.value = controller
                                    .admin[selectedItem].unName
                                    .toString();
                              },
                              children: List<Widget>.generate(
                                controller.admin.length,
                                (int index) {
                                  return Center(
                                    child: Text(
                                      "${controller.admin[index].unName}",
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() {
                                return Text(
                                  controller.selectedAdmin.value,
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 12.sp,
                                  ),
                                );
                              }),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                                size: 14.w,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ).paddingAll(20.r),
                  ),
                  10.verticalSpace,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.w),
                      border: Border.all(
                        color: Colors.grey,
                        width: .1.w,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15.r,
                          offset: Offset(0, 10.w),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBold(
                          text: "Pilih Waktu Penjemputan",
                          fontSize: 14.sp,
                        ),
                        SizedBox(height: 10.h),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(374.w, 50.h),
                            backgroundColor: primary,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                          ),
                          onPressed: () => _showDialog(
                            CupertinoPicker(
                              magnification: 1.22,
                              squeeze: 1.2,
                              useMagnifier: true,
                              itemExtent: kItemExtent,
                              // This is called when selected item is changed.
                              onSelectedItemChanged: (int selectedItem) {
                                controller.selectedJadwal.value =
                                    "${controller.jadwalPenjemputan[selectedItem].sDay} ${controller.jadwalPenjemputan[selectedItem].sTime}";
                              },
                              children: List<Widget>.generate(
                                controller.jadwalPenjemputan.length,
                                (int index) {
                                  return Center(
                                    child: Text(
                                      "${controller.jadwalPenjemputan[index].sDay} ${controller.jadwalPenjemputan[index].sTime}",
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() {
                                return Text(
                                  controller.selectedJadwal.value,
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 12.sp,
                                  ),
                                );
                              }),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                                size: 14.w,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ).paddingAll(20.r),
                  ),
                  10.verticalSpace,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.w),
                      border: Border.all(
                        color: Colors.grey,
                        width: .1.w,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15.r,
                          offset: Offset(0, 10.w),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        controller.obx(
                          (state) => RoundedButton(
                            text: 'Konfirmasi Penjualan',
                            textColor: white,
                            fontSize: 14.sp,
                            borderRadius: 12.w,
                            height: 56.h,
                            width: 376.w,
                            color: primary,
                            press: () {
                              controller.jualSampah(
                                controller.fileImage.value,
                                controller.dataSampah[0],
                                controller.geometry.latitude.toString(),
                                controller.geometry.longitude.toString(),
                                controller.beratSampahController.text,
                                controller.selectedJadwalId.value,
                                controller.selectedAdminId.value,
                              );
                            },
                          ),
                          onEmpty: RoundedButton(
                            text: 'Konfirmasi Penjualan',
                            textColor: white,
                            fontSize: 14.sp,
                            borderRadius: 12.w,
                            height: 56.h,
                            width: 376.w,
                            color: primary,
                            press: () {
                              controller.jualSampah(
                                controller.fileImage.value,
                                controller.dataSampah[0],
                                controller.geometry.latitude.toString(),
                                controller.geometry.longitude.toString(),
                                controller.beratSampahController.text,
                                controller.selectedJadwalId.value,
                                controller.selectedAdminId.value,
                              );
                            },
                          ),
                          onLoading: Center(
                            child: CupertinoActivityIndicator(
                              radius: 20.r,
                            ),
                          ),
                          onError: (error) => RoundedButton(
                            text: 'Konfirmasi Penjualan',
                            textColor: white,
                            fontSize: 14.sp,
                            borderRadius: 12.w,
                            height: 56.h,
                            width: Get.width,
                            color: primary,
                            press: () {
                              controller.jualSampah(
                                controller.fileImage.value,
                                controller.dataSampah[0],
                                controller.geometry.latitude.toString(),
                                controller.geometry.longitude.toString(),
                                controller.beratSampahController.text,
                                controller.selectedJadwalId.value,
                                controller.selectedAdminId.value,
                              );
                            },
                          ),
                        ),
                      ],
                    ).paddingAll(20.r),
                  ),
                ],
              ).paddingOnly(left: 20.w, right: 20.w, bottom: 20.h),
            ),
          ),
        ),
      ),
    );
  }

  Padding selectLocation() {
    return Padding(
      padding: EdgeInsets.only(left: 0.w, right: 0.w),
      child: controller.latlng.value == ''
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(374.w, 50.h),
                backgroundColor: primary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.w),
                ),
              ),
              onPressed: _selectPlace,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pilih Lokasi Dari Peta',
                    style: TextStyle(
                      color: white,
                      fontSize: 12.sp,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    size: 14.w,
                  ),
                ],
              ),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(374.w, 50.h),
                backgroundColor: primary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.w),
                ),
              ),
              onPressed: _selectPlace,
              child: Text(
                controller.latlng.value,
                maxLines: 1,
                style: TextStyle(
                  color: white,
                  fontSize: 14.sp,
                ),
              ),
            ),
    );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: Get.context!,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  Future<void> _selectPlace() async {
    final result = await Get.toNamed(Routes.SEARCHMAP);
    controller.latlng.value = result[0].toString();
    controller.geometry = result[1] as LatLng;
  }
}
