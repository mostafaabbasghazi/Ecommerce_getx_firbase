
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductController extends GetxController{
   TextEditingController productName=TextEditingController();
   TextEditingController productNameAr=TextEditingController();
   TextEditingController count=TextEditingController();
   TextEditingController price=TextEditingController();
   TextEditingController discount=TextEditingController();
   TextEditingController productDesc=TextEditingController();
   ImagePicker _picker=ImagePicker();
  File? selectImage;
  RxList categoryName=[].obs;
  late CollectionReference products;
  RxString dropdownvalue="TV".obs;

  @override
  void onInit()async {
    super.onInit();
    await getCattName();
    
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

  Future getImage()async{
    var image=await _picker.pickImage(source: ImageSource.gallery);
    if(image !=null){
      selectImage=File(image.path);
    }
    update();
    
  }

  Future uploadItem()async{
    var id=Random().nextInt(100000000);
    var nameImage=basename(selectImage!.path);
    Reference upload=FirebaseStorage.instance.ref().child("prodImage").child("${id.toString()+nameImage}");
    final UploadTask uploadTask=upload.putFile(selectImage!);
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

    await products.add(product);


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