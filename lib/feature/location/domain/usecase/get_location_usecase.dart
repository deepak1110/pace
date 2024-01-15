import 'package:pace_pro/feature/location/domain/entity/location_entity.dart';
import 'package:pace_pro/feature/location/domain/repository/location_repository.dart';

class GetLocationUsecase {
  LocationRepository locationRepository;

  GetLocationUsecase(this.locationRepository);

  Future<LocationEntity> call() async {
    LocationEntity locationEntity = await locationRepository.getAddress();
    return locationEntity;
  }
}
