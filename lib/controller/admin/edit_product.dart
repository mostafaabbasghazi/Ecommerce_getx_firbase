import 'dart:io';
import 'dart:math';
import 'package:firebaseecom/constant/routs_name.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProductController extends GetxController{
   TextEditingController productName=TextEditingController();
   TextEditingController productNameAr=TextEditingController();
   TextEditingController count=TextEditingController();
   TextEditingController price=TextEditingController();
   TextEditingController discount=TextEditingController();
   TextEditingController productDesc=TextEditingController();
  File? fileSelect;
  String imageLink="";
  RxList categoryName=[].obs;
  late CollectionReference products;
  RxString dropdownvalue="TV".obs;
  var idDocoument=Get.arguments[0];
  var productInfo=Get.arguments[1];

  @override
  void onInit()async {
    super.onInit();
    await getCattName();
    imageLink=productInfo["imageLink"];
    dropdownvalue.value=productInfo["category"];
    products=FirebaseFirestore.instance.collection("products");
    
  }

  @override
  void onClose() {
    super.onClose();
    productName.dispose();
    productNameAr.dispose();
    count.dispose();
    price.dispose();
    discount.dispose();
    productDesc.dispose();
    
  }

   void getImage()async{
     XFile? file=await ImagePicker().pickImage(source:ImageSource.gallery);
     if(file !=null){
      fileSelect=File(file.path);
       update();
     }

  }
 

 

  Future uploadItem()async{
    if(fileSelect !=null){
          var id=Random().nextInt(100000000);
    var nameImage=basename(fileSelect!.path);
    Reference upload=FirebaseStorage.instance.ref().child("prodImage").child("${id.toString()+nameImage}");
    final UploadTask uploadTask=upload.putFile(fileSelect!);
    final dounloadURL=await(await uploadTask).ref.getDownloadURL();

    Map<String,dynamic>product={
      "productName":productName.text,
      "productNameAr":productNameAr.text,
      "count":int.parse(count.text),
      "price":int.parse(price.text),
      "discount":int.parse(discount.text),
      "category":dropdownvalue.value,
      "desc":productDesc.text,
      "active":true,
      "imageLink":dounloadURL
    };

    await products.doc(idDocoument).update(product);
    Get.offAllNamed(AppRout.adminhome);

    }else{
        

    Map<String,dynamic>product={
      "productName":productName.text,
      "productNameAr":productNameAr.text,
      "count":int.parse(count.text),
      "price":int.parse(price.text),
      "discount":int.parse(discount.text),
      "category":dropdownvalue.value,
      "desc":productDesc.text,
      "active":true,
      "imageLink":imageLink
    };

    await products.doc(idDocoument).update(product);
    Get.offAllNamed(AppRout.adminhome);

    }

  }
   Future<void> getCattName()async{
    

     await FirebaseFirestore.instance.collection("categorey").get().then((value){
        value.docs.forEach((result)async{
          categoryName.add(result.data()["categorytName"].toString());          
      });
      });
      print(categoryName);
      print("kkkkkkkkkkkkkkkkkkkk");
      update();
}

}