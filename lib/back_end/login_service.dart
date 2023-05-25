import 'package:dio/dio.dart';
import 'package:koing_web_ver/back_end/secure_storage.dart';

import '../const.dart';
import 'backend_model.dart';
import '../back_end/login_model.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
class LoginService{
  /*Future<BackendModel> isSigning(String email, String password) async {
    final formData = {'email': email, 'password': password};
    Dio dio = Dio();
    dio.options.contentType = 'application/json;charset=UTF-8';
    final response = await dio.post(
      "${SwaggerUrl}/sign/sign-in",
      data: formData,
    );

    BackendModel signInRequestModel = BackendModel.fromJson(response.data);
    print(response.data);

    return signInRequestModel;
  }*/

  Future<BackendModel> isSigning(String email, String password) async {
    final formData = {'email': email, 'password': password};
   final headers = {'Content-Type':'application/json;charset=UTF-8'};
    Dio dio = Dio();
    dio.options.contentType = 'application/json;charset=UTF-8';
    var url=Uri.parse('//3.34.182.215:8080/sign/sign-in');
   var body= jsonEncode(formData);
    final response = await http.post(url,headers:headers,body: body);

    BackendModel signInRequestModel = BackendModel.fromJson(jsonDecode(response.body));
    print(response.body);

    return signInRequestModel;
  }
  Future<void> upDateUserModel(BackendModel backendModel) async{

     Map<String,dynamic> userInformation= LoginService().parseJwtPayLoad(backendModel.data['jwt']['accessToken']); // 로그인을 성공하면

    int userId=userInformation['userId'];
    var val = jsonEncode(LoginModel('${userInformation['sub']}','${backendModel.data['jwt']['accessToken']}', '${userId}',));// 토큰 값과 로그인 유지 정보를 val 변수에 담는다
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyyMMdd');

    SecureStorage().deleteSecureData('login');
    SecureStorage().deleteSecureData('userId');
    SecureStorage().deleteSecureData('userAccessToken');
    SecureStorage().deleteSecureData('userRefreshToken');
    SecureStorage().writeSecureData('login', val);
    SecureStorage().writeSecureData('userAccessToken', backendModel.data['jwt']['accessToken'].toString());
    SecureStorage().writeSecureData('userId', userId.toString());
    SecureStorage().writeSecureData('userRefreshToken', backendModel.data['jwt']['refreshToken'].toString());
    BackendModel userModel =await LoginService().getProfileInformation(userId.toString(),formatter.format(now).toString(),backendModel.data['jwt']['accessToken'],backendModel.data['jwt']['refreshToken'].toString());

    print(userModel);
    //await storage.write( key: 'login', value: val ); // login key에 SecureStorage에 담는다
//notifyListeners();
  }
  Map<String, dynamic> parseJwtPayLoad(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }


  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }
  Future<BackendModel> getProfileInformation(
      String userId, String today, String accessToken,String refreshToken) async {
    Dio dio = Dio();


    dynamic accessToken=await SecureStorage().readSecureData('userAccessToken');
    dynamic refreshToken=await SecureStorage().readSecureData('userRefreshToken');
    //print(userId);
    //print(today);


    late final response ;
    try{response = await dio.get(
        "$SwaggerUrl/user/mypage/$userId/$today",
        options: Options(
            validateStatus: (_) => true,
            contentType: 'application/json;charset=UTF-8',
            headers: {'authorization':accessToken }
        ));}catch(e){
      dynamic userToken=await SecureStorage().readSecureData('userAccessToken');
      response = await dio.get(

          "${SwaggerUrl}/user/mypage/${userId}/${today}",
          options: Options(
              validateStatus: (_) => true,
              contentType: 'application/json;charset=UTF-8',
              headers: {'authorization':userToken }
          ));
    }
    print('hello');
    //print(response.data);
    BackendModel profileModel = BackendModel.fromJson(response.data);

    print(profileModel.data);

    return profileModel;
  }
}