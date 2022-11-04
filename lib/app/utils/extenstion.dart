import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

Future<LatLng> getPosition() async {
  final Location location = Location();
  if (!await location.serviceEnabled()) {
    if (!await location.requestService()) throw 'GPS service is disabled';
    await getPosition();
  }
  if (await location.hasPermission() == PermissionStatus.denied) {
    if (await location.requestPermission() != PermissionStatus.granted) {
      throw 'No GPS permissions';
    }
    await getPosition();
  }
  final LocationData data = await location.getLocation();
  return LatLng(data.latitude!, data.longitude!);
}
