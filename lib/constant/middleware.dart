
import 'package:firebaseecom/constant/routs_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../servies/servies.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRout.home);
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name:AppRout.login);
    }

    return null;
  }
}
