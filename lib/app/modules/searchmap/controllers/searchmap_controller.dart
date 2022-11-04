import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchmapController extends GetxController {
  Rx<LatLng> data = const LatLng(0.0, 0.0).obs;
  List<Marker> myMarker = <Marker>[].obs;

  //RxList<Place> searchSugesstion = <Place>[].obs;
  late GoogleMapController googleMapController;

  // final debouncer = Debouncer(
  //   delay: const Duration(milliseconds: 500),
  // );

  Future<void> getMarker(Marker marker) async {
    myMarker.clear();
    myMarker.add(marker);
  }

  // void searchLocation(String query) {
  //   debouncer.call(() {
  //     SearchmapProvider().loadSearch(query).then(
  //           (value) => {
  //             searchSugesstion.value = value
  //                 .map((e) => Place.fromJson(e as Map<String, dynamic>))
  //                 .toSet()
  //                 .toList()
  //           },
  //         );
  //   });
  // }

  void goToSearch(
    double lat,
    double long,
    GoogleMapController googleMapController,
  ) {
    final CameraPosition cameraPosition = CameraPosition(
      target: LatLng(lat, long),
      zoom: 18.151926040649414,
    );
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
  }

  Future<String> getAddress(LatLng coordinate) async {
    final List<Placemark> placemarks = await placemarkFromCoordinates(
      coordinate.latitude,
      coordinate.longitude,
    );
    final first = placemarks.first;
    final locality = first.locality ?? '';
    final administrativeArea = first.administrativeArea ?? '';
    final subLocality = first.subLocality ?? '';
    final subAdministrativeArea = first.subAdministrativeArea ?? '';
    final street = first.street ?? '';
    final addressLine =
        '$street, $locality, $subLocality, $subAdministrativeArea, $administrativeArea';
    return addressLine;
  }
}
