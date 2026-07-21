import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@Freezed()
abstract class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial<T>;
  const factory LoginState.loading() = _Loading<T>;
  const factory LoginState.success(T data) = _Success<T>;
  const factory LoginState.error({required String error}) = _Error<T>;
}
