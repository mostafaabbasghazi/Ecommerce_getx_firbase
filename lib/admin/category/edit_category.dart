import 'dart:io';


import 'package:firebaseecom/controller/admin/add_category.dart';
import 'package:firebaseecom/controller/admin/edit_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../function/vaildate.dart';
import '../../screens/widget/custtom_text_field.dart';

class EditCategory extends StatelessWidget {
  const EditCategory({super.key});

  @override
  Widget build(BuildContext context) {
    EditCategoryController controller=Get.put(EditCategoryController());
    return GetBuilder<EditCategoryController>(builder: (controller){
      return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text("Edit Catiegory",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
      body: Container(
        margin: const EdgeInsets.only(left: 20,top: 20,right: 20),
        child: ListView(
          
          children: [
            CircleAvatar(
            radius: 100,
            backgroundColor: Colors.grey,
            backgroundImage:  controller.fileSelect != null
                ? FileImage(controller.fileSelect as File,)
                : NetworkImage(controller.imageLink),
          ),
          TextButton.icon(
            onPressed: controller.getImage,
            icon: const Icon(Icons.image),
            label: const Text('Add Image'),),
            
            const SizedBox(height: 10,),
            const Divider(height: 3,color: Colors.black,thickness: 3,),
            const SizedBox(height: 10,),
            const Text("Catiegory Name:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            const SizedBox(height: 20,),
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
            const SizedBox(height: 20,),
            const Text("Catiegory Name Arabic:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            const SizedBox(height: 10,),
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
             
           const SizedBox(height: 30,),
            InkWell(
              onTap: (){
                controller.uploadItem();
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: const Center(
                  child: Text("Save",style: TextStyle(fontSize: 20,color: Colors.white),),
                ),
              ),
            ),
            const SizedBox(height: 40,)
            
          ],
        ),
      ),
    );
    });
  }
}