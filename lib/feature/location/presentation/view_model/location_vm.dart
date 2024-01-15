import 'package:get/get.dart';
import 'package:pace_pro/feature/location/domain/entity/location_entity.dart';
import 'package:pace_pro/feature/location/domain/usecase/get_location_usecase.dart';

class LocationVM extends GetxController {
  GetLocationUsecase locationUsecase;
  LocationVM(this.locationUsecase);

  final Rx<LocationEntity> _state = LocationEntity().obs;
  LocationEntity get getState => _state.value;
  set _setState(LocationEntity locationData) {
    _state.value = locationData;
  }

  void getLocation() async {
    try {
      _setState = LocationEntity();
      LocationEntity locationEntity = await locationUsecase.call();
      _setState = locationEntity;
    } catch (e) {
      _setState = LocationEntity(
        error: e.toString(),
      );
    }
  }
}
