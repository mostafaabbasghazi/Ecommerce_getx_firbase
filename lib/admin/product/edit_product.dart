import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/admin/edit_product.dart';
import '../../function/vaildate.dart';
import '../../screens/widget/custtom_text_field.dart';

class EditProduct extends StatelessWidget {
  const EditProduct({super.key});

  @override
  Widget build(BuildContext context) {
    EditProductController controller =Get.put(EditProductController());
    return GetBuilder<EditProductController>(builder: (controller){
      return Scaffold(
      appBar: AppBar(title:Text("Edit Product",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
      body: Container(
        margin: EdgeInsets.only(left: 20,top: 20,right: 20),
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
            
            SizedBox(height: 10,),
            Divider(height: 3,color: Colors.black,thickness: 3,),
            SizedBox(height: 10,),
            Text("Product Name:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 20,),
            CustomTextForm(
                hinttext:"Enter Your Product Name" ,
                labeltext: "Product Name",
                iconData: Icons.title_outlined,
                mycontroller: controller.productName,
                isNumber: false,
                valid: (value) {
                  return validInput(value!, 3, 20, "");
                },
                ),
            SizedBox(height: 20,),
            Text("Product Name Arabic:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 10,),
            CustomTextForm(
                hinttext:"Enter Your Product Name Arabic" ,
                labeltext: "Product Name Arabic",
                iconData: Icons.title_outlined,
                mycontroller: controller.productNameAr,
                isNumber: false,
                valid: (value) {
                  return validInput(value!, 3, 20, "");
                },
                ),
                        SizedBox(height: 20,),
            Text("Product desciption:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 10,),
            CustomTextForm(
                hinttext:"Enter Your Description" ,
                labeltext: "Description",
                iconData: Icons.title_outlined,
                mycontroller: controller.productDesc,
                isNumber: false,
                valid: (value) {
                  return validInput(value!, 3, 20, "");
                },
                ),
             SizedBox(height: 20,),
            Text("Product Count:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 10,),
            CustomTextForm(
                hinttext:"Enter Your Product Count" ,
                labeltext: "Produc Count",
                iconData: Icons.numbers_outlined,
                mycontroller: controller.count,
                isNumber: true,
                valid: (value) {
                  return validInput(value!, 3, 20, "");
                },
                ),
             SizedBox(height: 20,),
            Text("Product Price:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 10,),
            CustomTextForm(
                hinttext:"Enter Your Product Price" ,
                labeltext: "Product Price",
                iconData: Icons.price_check,
                mycontroller: controller.price,
                isNumber: true,
                valid: (value) {
                  return validInput(value!, 3, 20, "");
                },
                ),
             SizedBox(height: 20,),
            Text("Product Discount:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 10,),
            CustomTextForm(
                hinttext:"Enter Your Product Discount" ,
                labeltext: "Product Discount",
                iconData: Icons.price_change_outlined,
                mycontroller: controller.discount,
                isNumber: true,
                valid: (value) {
                  return validInput(value!, 3, 20, "");
                },
                ),
            SizedBox(height: 20,),
            Text("Chose Category:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 10,),
           GetBuilder<EditProductController>(
            
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
              
                controllerr.dropdownvalue.value=newValue.toString();
              
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
    });
  }
}