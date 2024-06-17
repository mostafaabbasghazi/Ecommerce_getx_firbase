import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseecom/constant/routs_name.dart';
import 'package:firebaseecom/screens/widget/alert.dart';
import 'package:firebaseecom/servies/servies.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController{

  late TextEditingController email;

  bool isLoading=false;



  GlobalKey <FormState> globalKey=GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    email=TextEditingController();
   
  }

  @override
  void onClose() {
    super.onClose();
    email.clear();
 
  }

  Future<void> _reCoverPassword()async{
    isLoading=true;
    var formState=globalKey.currentState;
 
    try {
    if(formState!.validate()){
       await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      isLoading=false;
      Get.toNamed(AppRout.login);

    }else{
      isLoading=false;
      alert("Try agin");
    }
    }catch(e){
      isLoading=false;
      alert("Check Internet");

    }
  }

  Future<void> Function()get reCoverPassword=>_reCoverPassword;
  
}