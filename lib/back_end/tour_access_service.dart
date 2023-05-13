import 'package:dio/dio.dart';
import 'package:koing_web_ver/back_end/secure_storage.dart';

import '../const.dart';
import 'backend_model.dart';
import '../back_end/login_model.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class TourAccessService{
  Future<BackendModel> getTourList(
      String jwtToken, List<String> categories) async {
    Dio dio = Dio();

    final response = await dio.get("${SwaggerUrl}/tour",
        options: Options(
          contentType: 'application/json;charset=UTF-8',
          headers: {
            'authorization': jwtToken,
          },
        ),
        queryParameters: {'categories': categories});
    BackendModel userInformationModel = BackendModel.fromJson(response.data);
    print(response.data);

    return userInformationModel;
  }
}