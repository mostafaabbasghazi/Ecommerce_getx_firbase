import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseecom/constant/routs_name.dart';
import 'package:firebaseecom/screens/widget/alert.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LoginAdminController extends GetxController{

  late TextEditingController email;
  late TextEditingController password;

  late CollectionReference users;


  GlobalKey <FormState> globalKey=GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    email=TextEditingController();
    password=TextEditingController();
    users = FirebaseFirestore.instance.collection('users');
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

      FirebaseFirestore.instance.collection("users").get().then((value){
        value.docs.forEach((result)async{
          if(result.data()["email"]==email.text && result.data()["isAdmin"]==true ){
          }
        });
      });


    } on FirebaseAuthException catch(e) {
        if (e.code == 'user-not-found') {
          alert("No user found for that email.");
  } else if (e.code == 'wrong-password') {
    alert("Wrong password provided for that user.");
  }

    } catch(e){
      alert("Check InterNet");
    }
  }
  
}