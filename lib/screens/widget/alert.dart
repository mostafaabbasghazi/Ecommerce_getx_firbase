import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
Future<bool> alert(String title) {
  Get.defaultDialog(
      title: "attention",
      titleStyle:const  TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),
      middleText:title,
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              Get.back();
            },
            child:const Text("Try Again"))
      ]);
  return Future.value(true);
}
