import 'dart:io';
import 'dart:math';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../constant/routs_name.dart';

class AddCategoryController extends GetxController{
  late TextEditingController categotryName;
  late TextEditingController categoryNameAr;
  File? fileSelect;
  
  late CollectionReference category;

    @override
  void onInit() {
    super.onInit();
    
    categoryNameAr=TextEditingController();
    categotryName=TextEditingController();
    category=FirebaseFirestore.instance.collection("categorey");
    
  }

  @override
  void onClose() {
    super.onClose();
    categotryName.dispose();
    categoryNameAr.dispose();
  }

   void getImage()async{
     XFile? file=await ImagePicker().pickImage(source:ImageSource.gallery);
     if(file !=null){
      fileSelect=File(file.path);
       update();
     }

  }
 
  Future uploadItem()async{
    var id=Random().nextInt(100000000);
    var nameImage=basename(fileSelect!.path);
    Reference upload=FirebaseStorage.instance.ref().child("CatImage").child("${id.toString() +nameImage}");
    final UploadTask uploadTask=upload.putFile(fileSelect!);
    final dounloadURL=await(await uploadTask).ref.getDownloadURL();

    Map<String,dynamic>categories={
      "categorytName":categotryName.text,
      "categoryNameAr":categoryNameAr.text,
      "active":true,
      "imageLink":dounloadURL
    };

    await category.add(categories);
    Get.offAllNamed(AppRout.adminhome);
  }
}