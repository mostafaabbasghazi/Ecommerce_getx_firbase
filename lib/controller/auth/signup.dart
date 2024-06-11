import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseecom/constant/routs_name.dart';
import 'package:firebaseecom/screens/widget/alert.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
class SignUpController extends GetxController{

  late TextEditingController email;
  late TextEditingController name;
  late TextEditingController password;

  late CollectionReference users;

 

  GlobalKey <FormState> globalKey=GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    users = FirebaseFirestore.instance.collection('users');
    email=TextEditingController();
    name=TextEditingController();
    password=TextEditingController();

    
    
  }

  @override
  void onClose() {
    super.onClose();

    email.clear();
    name.clear();
    password.clear();
  }

 Future<void> signUp ()async{

    try {
      final credential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);

      

      await users.add({
        "userId":FirebaseAuth.instance.currentUser!.uid,
        "email":email.text,
        "name":name.text,
        "password":password.text,
        "image":"image user",
        "isAdmin":false

      }).then((value)async{


        Get.toNamed(AppRout.login);

      }).catchError((error) => print("Failed to add user: $error"));;

    } on FirebaseAuthException catch (e) {
      if(e.code=="weak-password"){
        alert("Passsword Is Very Weak");
      }else if(e.code=="email-already-in-use"){
         alert("email-already-in-use");
      }
    }catch(e){
      alert("Check Your Connection");
    }
    
  }
}