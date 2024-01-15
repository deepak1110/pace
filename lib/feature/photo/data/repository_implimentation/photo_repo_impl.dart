import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:pace_pro/feature/photo/data/data_source/ds.dart';
import 'package:pace_pro/feature/photo/domain/entity/Image_entity.dart';
import 'package:pace_pro/feature/photo/domain/repository/photo_repositroy.dart';

class PhotoRepoImpl extends PhotoRepository {
  PickImageDS impl;
  PhotoRepoImpl(this.impl);
  @override
  Future<ImageEntity> getImage(
      {required ImageSource source, int? quality}) async {
    String? imageModel = await impl.getImage(source: source);

    File image = File(imageModel!);
    int fileSizeInBytes = await image.length();
    double fileSizeInMB = fileSizeInBytes / (1024 * 1024);
    return ImageEntity(
      imageFile: image,
      fileSizeInMb: fileSizeInMB,
    );
  }

  @override
  Future<ImageEntity> resizeImage(
      {required File image, required int quality}) async {
    String? imageModel =
        await impl.resizeImage(image: image, imageQuality: quality);

    File newImage = File(imageModel!);
    int fileSizeInBytes = await newImage.length();
    double fileSizeInMB =
        fileSizeInBytes / (1024 * 1024); // Convert bytes to megabytes
    return ImageEntity(
      imageFile: newImage,
      fileSizeInMb: fileSizeInMB,
    );
  }
}
