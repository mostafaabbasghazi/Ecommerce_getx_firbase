import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseecom/servies/servies.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';


class ProfileController extends GetxController{
  MyServices services =Get.find();
  RxString userName="".obs;
  RxString userEmail="".obs;
  RxString userImage="".obs;
  
  @override
  void onInit()async {
    super.onInit();
    await getUserInfo();
    
    

  }

  @override
  void onClose() {
    super.onClose();
   
  }
  getUserInfo()async{
    var data=await FirebaseFirestore.instance.collection("users").where("userId",isEqualTo: services.sharedPreferences.getString("userId")).get().then((onValue){
      onValue.docs.forEach((action){
        userName.value=action.data()["name"];
        userEmail.value=action.data()["email"];
        userImage.value=action.data()["image"];
        update();
      });
    });
  }


 


}