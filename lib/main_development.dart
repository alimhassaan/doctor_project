import 'package:doctor_app/core/helpers/constants.dart';
import 'package:doctor_app/core/helpers/extensions.dart';
import 'package:doctor_app/core/helpers/shared_pref_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'core/routing/app_router.dart';
import 'doc_app.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  setupGetIt();
   await checkIfLoggedInUser();
  //? To fix font bug in flutter_screenutil in release mode
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(DocApp(appRouter: AppRouter()));
}

Future<void> checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  // ignore: unnecessary_null_comparison
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  }else{
    isLoggedInUser = false;
  }
}
