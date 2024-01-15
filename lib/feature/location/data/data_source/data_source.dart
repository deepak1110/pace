import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pace_pro/utls/utls.dart';

abstract class GetLocationDS {
  Future<Placemark> getAddress();
}

class GetLocationImpl extends GetLocationDS {
  @override
  Future<Placemark> getAddress() async {
    try {
      if (await Utls().determinePosition()) {
        Position data = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        List<Placemark> placemarks =
            await placemarkFromCoordinates(data.latitude, data.longitude);

        return placemarks.first;
      }
      throw "permission error";
    } catch (e) {
      rethrow;
    }
  }
}
