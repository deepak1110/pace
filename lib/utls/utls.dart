import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pace_pro/widgets/popup_dialog.dart';

class Utls {
  addComma(String? val) {
    if (val?.trim().isEmpty == true) {
      return "";
    }
    return ",$val";
  }

  Future<bool> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      throw 'Location services are disabled.';
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        throw 'Location permissions are denied';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, then open dialog box to open settings .

      popupDialog(
        title: "Permission Denied",
        subTitle:
            "Looks like you permanently denied location settings click on open setting to give the access of location settings!!!",
        action: TextButton(
          onPressed: () {
            Geolocator.openAppSettings();
          },
          child: const Text('Open settings'),
        ),
      );

      throw "Location permissions are denied";
    }

    return true;
  }
}
