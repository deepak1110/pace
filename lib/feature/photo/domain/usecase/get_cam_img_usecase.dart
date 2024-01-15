import 'package:image_picker/image_picker.dart';
import 'package:pace_pro/feature/photo/domain/entity/Image_entity.dart';
import 'package:pace_pro/feature/photo/domain/repository/photo_repositroy.dart';

class GetCamImageUsecase {
  PhotoRepository photoRepository;
  GetCamImageUsecase(this.photoRepository);

  Future<ImageEntity> call() async {
    ImageEntity imageEntity =
        await photoRepository.getImage(source: ImageSource.camera);
    return imageEntity;
  }
}
