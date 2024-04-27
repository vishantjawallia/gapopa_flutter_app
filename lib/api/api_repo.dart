import 'dart:convert';

import 'package:gapopa_flutter_app/config/config.dart';
import 'package:gapopa_flutter_app/models/base_model.dart';

import '../models/image_model.dart';
import 'api_service.dart';
import 'api_repository.dart';

class ApiRepo implements ApiService {
  ApiRepo._();
  static ApiRepo get instance => ApiRepo._();

  @override
  Future<BaseModel<ImageModel?>> getImages(query) async {
    final response = await ApiRepository.get('${Config.baseUrl}$query');

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      ImageModel model = ImageModel.fromJson(data);

      return BaseModel(success: true, msg: "", data: model);
    } else {
      return const BaseModel(success: false, msg: "Exceptiona Occured!", data: null);
    }
  }
}
