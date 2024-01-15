import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:pace_pro/feature/photo/domain/entity/Image_entity.dart';

abstract class PhotoRepository {
  Future<ImageEntity> getImage({required ImageSource source, int? quality});
  Future<ImageEntity> resizeImage({required File image, required int quality});
}
