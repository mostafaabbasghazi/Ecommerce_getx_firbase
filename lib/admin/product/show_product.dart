import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseecom/admin/product/edit_product.dart';
import 'package:firebaseecom/constant/colors.dart';
import 'package:firebaseecom/controller/admin/show_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowProduct extends StatelessWidget {
  const ShowProduct({super.key});

  @override
  Widget build(BuildContext context) {
    ShowProductsController controller=Get.put(ShowProductsController());
    return GetBuilder<ShowProductsController>(builder: (controller){
      return Scaffold(
        backgroundColor: AppColor.grey,
        appBar: AppBar(
          title: const Text("All Products",style: TextStyle(fontSize: 26),),
          centerTitle: true,
        ),
        body:  Container(
      margin: const EdgeInsets.all(20),
                  child:FutureBuilder<QuerySnapshot>(
                    future:FirebaseFirestore.instance.collection("products").get() ,
                    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                      if (snapshot.hasError) {return const Center(child:Text('Error Try Again') ,);}
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return  const Center(child:CircularProgressIndicator(color: Colors.blue,));
                      }
                      if(snapshot.hasData){
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context,index){
                              return
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child:ListTile(
                                      title: Text("name:${controller.products[index]["productName"]}",style: const TextStyle(fontSize: 18),),
                                      subtitle:Text("category:${controller.products[index]["category"]}",style: const TextStyle(fontSize: 15)) ,
                                      leading: IconButton(onPressed: (){
                                        Get.to(()=>const EditProduct(),arguments: [controller.docId[index],controller.products[index]]);
                                      }, icon: const Icon(Icons.edit,color: Colors.blueAccent,)),
                                      trailing:
                                      IconButton(icon: const Icon(Icons.delete,color: Colors.red,),onPressed: ()async{
                                        
                                        var collection = FirebaseFirestore.instance
                                            .collection('products');
                                        var querySnapshots = await collection.get();

                                        collection.doc(controller.docId[index]).delete().then((value){
                                          
                                        });
                                      },)
                                  ) ,
                                );



                          },);
                      }
                      return const Text("");
                    },
                  ))
           ,
      );
    });
  }
}