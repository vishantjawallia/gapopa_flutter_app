
import 'package:gapopa_flutter_app/models/image_model.dart';

import '../models/base_model.dart';

abstract class ApiService {
  /// [Get]
  // Future<BaseModel<UserModel?>> userDetail();
  Future<BaseModel<ImageModel?>> getImages(query);

  /// [Post]
  // Future<BaseModel<UserModel?>> login();
}
