import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'core/routing/app_router.dart';
import 'doc_app.dart';

void main() async {
  setupGetIt();


  //? To fix font bug in flutter_screenutil in release mode
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(appRouter: AppRouter()));
}


