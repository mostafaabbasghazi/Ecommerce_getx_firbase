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

  Future<void> SignIn()async{
    try {

      final credential =await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
  
      myServices.sharedPreferences.setString("email",email.text);
      myServices.sharedPreferences.setString("userId",FirebaseAuth.instance.currentUser!.uid);
      myServices.sharedPreferences.setString("step","2");
      Get.toNamed(AppRout.home);


    } on FirebaseAuthException catch(e) {
        if (e.code == 'user-not-found') {
          alert("No user found for that email.");
  } else if (e.code == 'wrong-password') {
    alert("Wrong password provided for that user.");
  }

    }catch(e){
      alert("Check Internet");

    }
  }
  
}