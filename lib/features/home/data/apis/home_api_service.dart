

import 'package:dio/dio.dart';
import '../../../../core/networking/api_constans.dart';
import 'home_api_constans.dart';
import '../models/specializations_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part'home_api_service.g.dart';
@RestApi(
  baseUrl: ApiConstans.baseUrl ,
)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(HomeApiConstans.specializationEP)
  Future<SpecializationsResponseModel> getSpecialization();

}