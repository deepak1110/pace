import 'package:geocoding/geocoding.dart';
import 'package:pace_pro/feature/location/data/data_source/data_source.dart';
import 'package:pace_pro/feature/location/domain/entity/location_entity.dart';
import 'package:pace_pro/feature/location/domain/repository/location_repository.dart';
import 'package:pace_pro/utls/utls.dart';

class LocationRepoImpl extends LocationRepository {
  GetLocationDS getLocationDS;

  LocationRepoImpl(this.getLocationDS);
  @override
  Future<LocationEntity> getAddress() async {
    Placemark placemark = await getLocationDS.getAddress();

    return LocationEntity(
      placemark: placemark,
      address:
          "${placemark.name}, ${Utls().addComma(placemark.street)} , ${Utls().addComma(placemark.subLocality)},${Utls().addComma(placemark.locality)},${Utls().addComma(placemark.country)},pin-code=${placemark.postalCode},",
    );
  }
}
