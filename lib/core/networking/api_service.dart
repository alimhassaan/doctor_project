import 'package:dio/dio.dart';
import 'package:doctor_app/core/networking/api_constans.dart';
import 'package:doctor_app/features/login/data/models/login_request_body.dart';
import 'package:doctor_app/features/login/data/models/login_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part   'api_service.g.dart';

@RestApi(baseUrl: ApiConstans.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;


  @POST(ApiConstans.login)
  Future<LoginResponse>login (
    @Body() LoginRequestBody loginRequestBody,
  );

}
