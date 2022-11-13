import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../utils/colors.dart';
import '../../../utils/extenstion.dart';
import '../../../utils/rounded_button.dart';
import '../../../utils/text_default.dart';
import '../controllers/searchmap_controller.dart';

class SearchmapView extends GetView<SearchmapController> {
  const SearchmapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Pilih titik penjemputan'),
        backgroundColor: const Color(0xff266D05),
      ),
      body: SafeArea(
        child: buildMap(),
      ),
    );
  }

  Widget buildMap() {
    return Scaffold(
      body: FutureBuilder(
        future: getPosition(),
        builder: (context, AsyncSnapshot<LatLng> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Obx(
              () => GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: snapshot.data!, zoom: 18),
                onMapCreated: (GoogleMapController controller) {
                  this.controller.googleMapController = controller;
                  this.controller.myMarker.clear();
                  this.controller.myMarker.add(
                        Marker(
                          markerId: const MarkerId('my'),
                          position: snapshot.data!,
                          onTap: () => onMarkerClickHandler(snapshot.data!),
                        ),
                      );
                },
                onTap: onTapMapHandler,
                markers: Set<Marker>.of(controller.myMarker),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasError) {
            return const Center(
              child: TextSemiBold(
                text: "Terjadi Kesalahan, Cobalah beberapa saat lagi!",
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<void> onTapMapHandler(LatLng latLng) async {
    onMarkerClickHandler(latLng);
    final marker = Marker(
      markerId: const MarkerId('my'),
      position: LatLng(latLng.latitude, latLng.longitude),
      onTap: () => onMarkerClickHandler(latLng),
    );
    await controller.getMarker(marker);
  }

  Future<void> onMarkerClickHandler(LatLng latLng) async {
    Get.bottomSheet(
      Container(
        height: 300.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.place_rounded,
              size: 100.h,
              color: primary,
            ),
            10.verticalSpace,
            TextMedium(
              text: await controller.getAddress(
                LatLng(latLng.latitude, latLng.longitude),
              ),
              fontSize: 16.sp,
            ),
            20.verticalSpace,
            RoundedButton(
              text: "Pilih Lokasi",
              height: 30.h,
              width: 100.w,
              press: () async {
                Get.back();
                Get.back(
                  result: [
                    await controller.getAddress(
                      LatLng(latLng.latitude, latLng.longitude),
                    ),
                    LatLng(latLng.latitude, latLng.longitude)
                  ],
                );
              },
            ),
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
    );
  }
}
