import 'package:firebaseecom/controller/admin/add_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCat extends StatelessWidget {
  const AddCat({super.key});

  @override
  Widget build(BuildContext context) {
    AddCategoryController controller=Get.put(AddCategoryController());
    return Scaffold(
      appBar: AppBar(title:Text("Add Catiegory",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
      body: Container(
        margin: EdgeInsets.only(left: 20,top: 20,right: 20),
        child: ListView(
          
          children: [
            Text("Chose Catiegory Image:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 20,),
            Center(
              child: Container(
              height:150 ,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 1.5),
                borderRadius: BorderRadius.circular(90)
              ),
              child: InkWell(
                onTap: (){
                  controller.getImage();
                },
                child: Icon(Icons.camera_alt_outlined,size: 50,),
              ),
            ),
            ),
            SizedBox(height: 10,),
            Divider(height: 3,color: Colors.black,thickness: 3,),
            SizedBox(height: 10,),
            Text("Catiegory Name:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 20,),
            TextFormField(
               validator: (value) {
                if(value!.isEmpty){
                  return "CatNme is Empty";
                }
              },
              controller: controller.categotryName,
              decoration: InputDecoration(
                  hintText: "Enter Your Catiegory Name",
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text("Catiegory Name")),
            
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                
              ),
            ),
            SizedBox(height: 20,),
            Text("Catiegory Name Arabic:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 10,),
            TextFormField(
               validator: (value) {
                if(value!.isEmpty){
                  return "CatNameAr is Empty ";
                }
              },
              controller: controller.categoryNameAr,
              decoration: InputDecoration(
                  hintText: "Enter Your Catiegory Name Ar",
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text("Catiegory Name Ar")),
            
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                
              ),
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
  }
}