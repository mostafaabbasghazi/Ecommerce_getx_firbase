import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseecom/constant/routs_name.dart';
import 'package:firebaseecom/screens/widget/alert.dart';
import 'package:firebaseecom/servies/servies.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  late TextEditingController email;
  late TextEditingController password;
  bool isLoading=false;

  MyServices myServices = Get.find();

  GlobalKey <FormState> globalKey=GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    email=TextEditingController();
    password=TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    email.clear();
    password.clear();
  }

  Future<void> _signIn()async{
    isLoading=true;
    var formState=globalKey.currentState;
 
    try {
    if(formState!.validate()){
      final credential =await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
      myServices.sharedPreferences.setString("email",email.text);
      myServices.sharedPreferences.setString("userId",FirebaseAuth.instance.currentUser!.uid);
      myServices.sharedPreferences.setString("step","2");
      isLoading=false;
      Get.toNamed(AppRout.home);

    }else{
      isLoading=false;
      alert("Try agin");
    }
    } on FirebaseAuthException catch(e) {
          switch (e.code) {
      case "invalid-email":
       alert("invalid-email");
        break;
      case "wrong-password":
      alert("wrong-password");
        break;
      case "email-already-in-use":
      alert("email-already-in-use");
        break;
      default:
      alert("Unkhnow Erorr");
        
    }
  

    }catch(e){
      isLoading=false;
      alert("Check Internet");

    }
  }

  Future<void> Function()get signIn=>_signIn;
  
}