import 'package:get/get.dart';
import 'package:pace_pro/feature/location/data/data_source/data_source.dart';
import 'package:pace_pro/feature/location/data/repository_impl/location_repo_impl.dart';
import 'package:pace_pro/feature/location/domain/usecase/get_location_usecase.dart';
import 'package:pace_pro/feature/location/presentation/view_model/location_vm.dart';
import 'package:pace_pro/feature/photo/data/data_source/ds.dart';
import 'package:pace_pro/feature/photo/data/repository_implimentation/photo_repo_impl.dart';
import 'package:pace_pro/feature/photo/domain/usecase/compress_img_usecase.dart';
import 'package:pace_pro/feature/photo/domain/usecase/get_cam_img_usecase.dart';
import 'package:pace_pro/feature/photo/domain/usecase/get_gall_img_usecase.dart';
import 'package:pace_pro/feature/photo/presentation/view_model/photo_image_vm.dart';

class VmController {
  static final ResizeImageVM resizeImageVM = Get.put(
    ResizeImageVM(
      CompressImageUsecase(
        PhotoRepoImpl(PickImageImp()),
      ),
      GetCamImageUsecase(
        PhotoRepoImpl(
          PickImageImp(),
        ),
      ),
      GetGallImgUsecase(
        PhotoRepoImpl(
          PickImageImp(),
        ),
      ),
    ),
  );

  static final LocationVM locationVM = Get.put(LocationVM(
    GetLocationUsecase(
      LocationRepoImpl(
        GetLocationImpl(),
      ),
    ),
  ));
}
