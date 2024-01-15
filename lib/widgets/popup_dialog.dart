import 'package:flutter/material.dart';
import 'package:get/get.dart';

void popupDialog({
  required String title,
  required String subTitle,
  required TextButton action,
}) async {
  await showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Permission Denied'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                'Looks like you permanently denied location settings click on open setting to give the access of location settings!!!'),
            SizedBox(height: 10),
            FlutterLogo(size: 50),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
          action
        ],
      );
    },
  );
}
