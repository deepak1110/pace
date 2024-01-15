import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pace_pro/feature/location/presentation/view_model/location_vm.dart';
import 'package:pace_pro/utls/vm_controllers.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  final LocationVM controller = VmController.locationVM;

  @override
  void initState() {
    controller.getLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.getState.error != null) {
          Center(
            child: Text(
              controller.getState.address ??
                  controller.getState.error.toString(),
            ),
          );
        } else if (controller.getState.placemark == null) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 10,
              ),
              Text(
                "Fetching location",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          );
        }
        return Center(
          child: Text(
            controller.getState.address ?? controller.getState.error.toString(),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
