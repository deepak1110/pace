import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:pace_pro/feature/photo/presentation/view_model/photo_image_vm.dart';
import 'package:pace_pro/utls/color_constants.dart';
import 'package:pace_pro/utls/vm_controllers.dart';

class PhotoImage extends StatefulWidget {
  const PhotoImage({super.key});

  @override
  State<PhotoImage> createState() => _PhotoImageState();
}

class _PhotoImageState extends State<PhotoImage> {
  final ResizeImageVM controller = VmController.resizeImageVM;
  final Debouncer _debouncer = Debouncer(
    delay: const Duration(
      milliseconds: 500,
    ),
  );

  // showing the image section
  Widget imageView() {
    return Obx(() {
      if (controller.getImageEntity.imageFile == null) {
        return const Center(
          child: Text("please Select image"),
        );
      }

      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                const TextSpan(
                  text: 'Image quality:',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12.0,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "${controller.getQuality.toInt()} %",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: ColorConstants.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                const TextSpan(
                  text: ' Image size: ',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12.0,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text:
                      "${controller.getImageEntity.fileSizeInMb!.toStringAsFixed(2)} Mb",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: ColorConstants.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Image.file(
            controller.getImageEntity.imageFile!,
            height: Get.height / 2,
            fit: BoxFit.cover,
            width: 200,
          ),
          Slider(
            value: controller.getQuality,
            onChanged: (newValue) {
              controller.setQuality = newValue;
              _debouncer.call(() {
                controller.compressImage();
              });
            },
            min: 10,
            max: 100,
            label: 'image quality',
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: imageView()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                controller.onTapGallery();
              },
              child: const Text("Gallery"),
            ),
            ElevatedButton(
              onPressed: () {
                controller.onTapGetCamImage();
              },
              child: const Text("Camera"),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
