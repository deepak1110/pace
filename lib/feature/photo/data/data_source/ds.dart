import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

abstract class PickImageDS {
  Future<String?> getImage({required ImageSource source, int? imgQuality});
  Future<String?> resizeImage({required File image, required int imageQuality});
}

class PickImageImp implements PickImageDS {
  final ImagePicker _picker = ImagePicker();

  @override
  Future<String?> getImage(
      {required ImageSource source, int? imgQuality}) async {
    XFile? image = await _picker.pickImage(
      source: source,
      imageQuality: imgQuality,
    );

    return image?.path;
  }

  @override
  Future<String?> resizeImage(
      {required File image, required int imageQuality}) async {
    final Directory appDocDir = Directory.systemTemp;
    Directory temp = await appDocDir.createTemp();
    final String compressedImagePath = '${temp.path}/compressed_image.jpg';
    final XFile? compressImage = await FlutterImageCompress.compressAndGetFile(
      image.path,
      compressedImagePath,
      quality: imageQuality,
    );

    return compressImage?.path;
  }
}
