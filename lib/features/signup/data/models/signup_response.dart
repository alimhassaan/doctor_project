import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable(createToJson: false)
class SignupResponse {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  bool? success;
  int? code;

  SignupResponse({this.message, this.userData, this.success, this.code});

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}
@JsonSerializable(createToJson: false)
class UserData {
  String? token;
  @JsonKey(name: 'username')
  String? userName;
  UserData({this.token, this.userName});
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
