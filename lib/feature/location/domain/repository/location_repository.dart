import 'package:pace_pro/feature/location/domain/entity/location_entity.dart';

abstract class LocationRepository {
  Future<LocationEntity> getAddress();
}
