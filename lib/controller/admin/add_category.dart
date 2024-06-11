import 'dart:io';
import 'dart:math';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddCategoryController extends GetxController{
  late TextEditingController categotryName;
  late TextEditingController categoryNameAr;
  late ImagePicker _picker;
  File? selectImage;
  
  late CollectionReference category;

    @override
  void onInit() {
    super.onInit();
    _picker=ImagePicker();
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

  Future getImage()async{
    var image=await _picker.pickImage(source: ImageSource.gallery);
    
    selectImage=File(image!.path);
  }

  Future uploadItem()async{
    var id=Random().nextInt(100000000);
    var nameImage=basename(selectImage!.path);
    Reference upload=FirebaseStorage.instance.ref().child("CatImage").child("${id.toString() +nameImage}");
    final UploadTask uploadTask=upload.putFile(selectImage!);
    final dounloadURL=await(await uploadTask).ref.getDownloadURL();

    Map<String,dynamic>categories={
      "categorytName":categotryName.text,
      "categoryNameAr":categoryNameAr.text,
      "active":true,
      "imageLink":dounloadURL
    };

    await category.add(categories);
  }
}