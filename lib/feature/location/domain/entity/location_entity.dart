import 'package:geocoding/geocoding.dart';

class LocationEntity {
  final Placemark? placemark;
  final String? address;
  final String? error;

  LocationEntity({
    this.placemark,
    this.address,
    this.error,
  });
}
