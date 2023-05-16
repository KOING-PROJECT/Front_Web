import 'package:dio/dio.dart';


import '../const.dart';
import 'backend_model.dart';

class TourAccessService{
  Future<BackendModel> getTourListService(
      String jwtToken) async {
    Dio dio = Dio();

    final response = await dio.get("${SwaggerUrl}/admin/tour/created",
        options: Options(
          contentType: 'application/json;charset=UTF-8',
          headers: {
            'authorization': jwtToken,
          },
        ));
    BackendModel tourListModel = BackendModel.fromJson(response.data);
    print(response.data);

    return tourListModel;
  }

  Future<BackendModel> getTourDetailService(
  String jwtToken,int tourId) async {
    Dio dio = Dio();

    final response = await dio.get("${SwaggerUrl}/admin/tour/$tourId",
        options: Options(
          contentType: 'application/json;charset=UTF-8',
          headers: {
            'authorization': jwtToken,
          },
        ));
    BackendModel detailModel = BackendModel.fromJson(response.data);
    print(response.data);

    return detailModel;
  }
  /*Future<BackendModel> getTourList(
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
  }*/
}