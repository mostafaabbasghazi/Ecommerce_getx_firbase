import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseecom/constant/routs_name.dart';
import 'package:firebaseecom/screens/widget/alert.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
class SignUpController extends GetxController{

  late TextEditingController email;
  late TextEditingController name;
  late TextEditingController password;
  late TextEditingController address;
  late TextEditingController postNumber;
  File? fileSelect;
  bool isLoading=false;

  late CollectionReference users;

 

  GlobalKey <FormState> globalKey=GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    users = FirebaseFirestore.instance.collection('users');
    email=TextEditingController();
    name=TextEditingController();
    password=TextEditingController();
    address=TextEditingController();
    postNumber=TextEditingController();
    
    
    
  }

  @override
  void onClose() {
    super.onClose();
    email.clear();
    name.clear();
    password.clear();
    address.clear();
    postNumber.clear();
  }
  void _getImage()async{
     XFile? file=await ImagePicker().pickImage(source:ImageSource.gallery);
     if(file !=null){
      fileSelect=File(file.path);
       update();
     }

  }
 

 Future<void> _signUp ()async{
  isLoading=true;
  var formState=globalKey.currentState;


    try {
    if(formState!.validate()){
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);
    var id=Random().nextInt(100000000);
    var nameImage=basename(fileSelect!.path);
    Reference upload=FirebaseStorage.instance.ref().child("userImage").child("${id.toString()+nameImage}");
    final UploadTask uploadTask=upload.putFile(File(fileSelect!.path));
    final dounloadURL=await(await uploadTask).ref.getDownloadURL();
   

        await users.add({
        "userId":FirebaseAuth.instance.currentUser!.uid,
        "email":email.text,
        "name":name.text,
        "password":password.text,
        "address":address.text,
        "postNumber":postNumber.text,
        "image":dounloadURL ==null?"https://images.app.goo.gl/HfxHchn1HDgx6CW4A":dounloadURL,
        "isAdmin":false

      }).then((value)async{
        isLoading=false;
        Get.toNamed(AppRout.login);

      }).catchError((error){
        isLoading=false;
        alert("Add User Not Succes");
        
      });;

 
    
  }else{
    isLoading=false;
    alert("Try again");
  }

    } on FirebaseAuthException catch (e) {
       switch (e.code) {
      case "invalid-email":
        alert("invalid-email");
        break;

      case "weak-password":
        alert("weak-password");
        break;

      case "email-already-in-use":
      alert("email-already-in-use");
        
        break;
      default:
        
    }
    }catch(e){
      isLoading=false;
      alert("Check Your Connection");
    }
    
  }

  Future<void> Function() get signUp =>_signUp;
  void Function() get getImage => _getImage;
}