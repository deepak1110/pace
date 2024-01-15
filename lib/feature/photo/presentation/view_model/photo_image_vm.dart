import 'package:get/get.dart';
import 'package:pace_pro/feature/photo/domain/entity/Image_entity.dart';
import 'package:pace_pro/feature/photo/domain/usecase/compress_img_usecase.dart';
import 'package:pace_pro/feature/photo/domain/usecase/get_cam_img_usecase.dart';
import 'package:pace_pro/feature/photo/domain/usecase/get_gall_img_usecase.dart';

class ResizeImageVM extends GetxController {
  final CompressImageUsecase compressImageUsecase;
  final GetCamImageUsecase getCamImageUsecase;
  final GetGallImgUsecase getGallImgUsecase;

  ResizeImageVM(this.compressImageUsecase, this.getCamImageUsecase,
      this.getGallImgUsecase);

  final Rx<ImageEntity> _imageEntity = ImageEntity().obs;
  ImageEntity get getImageEntity => _imageEntity.value;
  set _setImageEntity(ImageEntity image) => _imageEntity.value = image;

  final Rx<ImageEntity> _orignalImage = ImageEntity().obs;
  ImageEntity get getOrignalImage => _orignalImage.value;
  set _setOrignalImage(ImageEntity image) => _orignalImage.value = image;

  final RxDouble _quality = 100.0.obs;
  double get getQuality => _quality.value;
  set setQuality(double quality) => _quality.value = quality;

  void onTapGetCamImage() async {
    try {
      ImageEntity? getImage = await getCamImageUsecase.call();
      _setOrignalImage = getImage;
      compressImage();
    } catch (e) {
      print(e);
    }
  }

  void onTapGallery() async {
    try {
      ImageEntity? getImage = await getGallImgUsecase.call();
      _setOrignalImage = getImage;

      compressImage();
    } catch (e) {
      print(e);
    }
  }

  void compressImage() async {
    ImageEntity? imageData = await compressImageUsecase.call(
      image: getOrignalImage.imageFile!,
      quality: getQuality.toInt(),
    );

    _setImageEntity = imageData;
  }
}
