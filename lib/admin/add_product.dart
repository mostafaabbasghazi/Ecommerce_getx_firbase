import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseecom/controller/admin/add_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
 
  AddProductController controller=Get.put(AddProductController());
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title:Text("Add Product",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
      body: Container(
        margin: EdgeInsets.only(left: 20,top: 20,right: 20),
        child: ListView(
          
          children: [
            Text("Chose Product Image:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 20,),
            
            Center(
              child: Container(
              height:150,
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
            ),),
            
            SizedBox(height: 10,),
            Divider(height: 3,color: Colors.black,thickness: 3,),
            SizedBox(height: 10,),
            Text("Product Name:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 20,),
            TextFormField(
              validator: (value) {
                if(value!.isEmpty){
                  return "Product Name is Empty";
                }
              },
              controller: controller.productName,
              decoration: InputDecoration(
                  hintText: "Enter Your Product Name",
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text("Product Name")),
            
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                
              ),
            ),
            SizedBox(height: 20,),
            Text("Product Name Arabic:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 10,),
            TextFormField(
              validator: (value) {
                if(value!.isEmpty ){
                  return "Email is Empty";
                }
              },
              controller: controller.productNameAr,
              decoration: InputDecoration(
                  hintText: "Enter Your Product Name Ar",
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text("Product Name Ar")),
            
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                
              ),
            ),
                        SizedBox(height: 20,),
            Text("Product desciption:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 10,),
            TextFormField(
              validator: (value) {
                if(value!.isEmpty && value!.length <5){
                  return "desciption is Empty or length less than 5";
                }
              },
              controller: controller.productDesc,
              decoration: InputDecoration(
                  hintText: "Enter Your Description",
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text("Product Description")),
            
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                
              ),
            ),
             SizedBox(height: 20,),
            Text("Product Count:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 10,),
            TextFormField(
               validator: (value) {
                if(value!.isEmpty){
                  return "Count is Empty";
                }
              },
              controller: controller.count,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Enter Your Count Product",
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text("Product Count Product")),
            
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                
              ),
            ),
             SizedBox(height: 20,),
            Text("Product Price:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 10,),
            TextFormField(
               validator: (value) {
                if(value!.isEmpty ){
                  return "Price is Empty ";
                }
              },
              controller: controller.price,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Enter Product Price",
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text("Product Price")),
            
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                
              ),
            ),
             SizedBox(height: 20,),
            Text("Product Discount:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 10,),
            TextFormField(
               validator: (value) {
                if(value!.isEmpty){
                  return "Discount is Empty";
                }
              },
              controller:controller.discount,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Enter Product Discount",
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text("Product Discount")),
            
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                
              ),
            ),SizedBox(height: 20,),
            Text("Chose Category:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 10,),
           GetBuilder<AddProductController>(
            
            builder:(controllerr){
              return  Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black)
              ),
              width: MediaQuery.of(context).size.width,
              child: Center(
                child:  DropdownButton<String>( 
                
              // Initial Value 
              value:controllerr. dropdownvalue.value, 
                
              // Down Arrow Icon 
              icon: const Icon(Icons.keyboard_arrow_down),     
                
              // Array list of items 
              items:controllerr. categoryName.map((items) { 
                return DropdownMenuItem<String>( 
                  value: items, 
                  child: Text(items), 
                ); 
              }).toList(), 
              // After selecting the desired option,it will 
              // change button value to selected value 
              onChanged: (String? newValue) {  
              setState(() {
                controllerr.dropdownvalue.value=newValue.toString();
              });
              }, ),
              )
            );
            }
            ),SizedBox(height: 30,),
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