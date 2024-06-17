import 'dart:io';
import 'dart:math';
import 'package:firebaseecom/constant/routs_name.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditCategoryController extends GetxController{
  late TextEditingController categotryName;
  late TextEditingController categoryNameAr;
  File? fileSelect;
  String imageLink="";



  var idCat=Get.arguments[0];
  var dataCategory=Get.arguments[1];
  
  late CollectionReference category;

    @override
  void onInit() {
    super.onInit();
    
    categoryNameAr=TextEditingController();
    categotryName=TextEditingController();
    category=FirebaseFirestore.instance.collection("categorey");
    imageLink=dataCategory["imageLink"];
    
  }

  @override
  void onClose() {
    super.onClose();
    categotryName.dispose();
    categoryNameAr.dispose();
  }
  upDateProducts()async{
  var collection =await FirebaseFirestore.instance.collection('card');
  var querySnapshots = await collection.get();
  for (var doc in querySnapshots.docs) {
     await doc.reference.update({
    'category': categotryName,
    });
  }

 }

   void getImage()async{
     XFile? file=await ImagePicker().pickImage(source:ImageSource.gallery);
     if(file !=null){
      fileSelect=File(file.path);
       update();
     }

  }
    getProductToUpDate(String catName,String newCate)async{
    var data =await FirebaseFirestore.instance.collection("products").where("category",isEqualTo: catName).get();
     for (var doc in data.docs) {
     await doc.reference.update({
      "category":newCate
     });
  }
     
  }
 
  Future uploadItem()async{
    if(fileSelect !=null){
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

    await category.doc(idCat).update(categories).then((v){
      getProductToUpDate(dataCategory["categorytName"], categotryName.text);
    });
   


    Get.offAllNamed(AppRout.adminhome);
  }else{
        Map<String,dynamic>categories={
      "categorytName":categotryName.text,
      "categoryNameAr":categoryNameAr.text,
      "active":true,
      "imageLink":imageLink
    };

    await category.doc(idCat).update(categories).then((v){
      getProductToUpDate(dataCategory["categorytName"], categotryName.text);
    });
   


    Get.offAllNamed(AppRout.adminhome);

  }
    }

   
}