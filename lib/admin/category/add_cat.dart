import 'dart:io';


import 'package:firebaseecom/controller/admin/add_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../function/vaildate.dart';
import '../../screens/widget/custtom_text_field.dart';

class AddCat extends StatelessWidget {
  const AddCat({super.key});

  @override
  Widget build(BuildContext context) {
    AddCategoryController controller=Get.put(AddCategoryController());
    return GetBuilder<AddCategoryController>(builder: (controller){
      return  Scaffold(
      appBar: AppBar(title:Text("Add Catiegory",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
      body: Container(
        margin: EdgeInsets.only(left: 20,top: 20,right: 20),
        child: ListView(
          
          children: [
            CircleAvatar(
            radius: 100,
            backgroundColor: Colors.grey,
            backgroundImage:  controller.fileSelect != null
                ? FileImage(controller.fileSelect as File,)
                : null,
          ),
          TextButton.icon(
            onPressed: controller.getImage,
            icon: const Icon(Icons.image),
            label: const Text('Add Image'),),
            
            SizedBox(height: 10,),
            Divider(height: 3,color: Colors.black,thickness: 3,),
            SizedBox(height: 10,),
            Text("Catiegory Name:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 20,),
            CustomTextForm(
                hinttext:"Enter Your Category Name" ,
                labeltext: "Category Name",
                iconData: Icons.title_outlined,
                mycontroller: controller.categotryName,
                isNumber: false,
                valid: (value) {
                  return validInput(value!, 3, 20, "");
                },
                ),
            SizedBox(height: 20,),
            Text("Catiegory Name Arabic:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 10,),
            CustomTextForm(
                hinttext:"Enter Category Name Arabic" ,
                labeltext: "Category Name Arabic",
                iconData: Icons.title_outlined,
                mycontroller: controller.categoryNameAr,
                isNumber: false,
                valid: (value) {
                  return validInput(value!, 3, 20, "");
                },
                ),
             
           SizedBox(height: 30,),
            InkWell(
              onTap: (){
                controller.uploadItem();
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Text("Save",style: TextStyle(fontSize: 20,color: Colors.white),),
                ),
              ),
            ),
            SizedBox(height: 40,)
            
          ],
        ),
      ),
    );
    });
  }
}