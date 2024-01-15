import 'dart:io';

import 'package:get/get.dart';
import 'package:pace_pro/feature/photo/domain/entity/Image_entity.dart';
import 'package:pace_pro/feature/photo/domain/repository/photo_repositroy.dart';

class CompressImageUsecase extends GetxController {
  PhotoRepository photoRepository;
  CompressImageUsecase(this.photoRepository);

  Future<ImageEntity> call({required File image, required int quality}) async {
    ImageEntity imageEntity = await photoRepository.resizeImage(
      image: image,
      quality: quality,
    );
    return imageEntity;
  }
}
