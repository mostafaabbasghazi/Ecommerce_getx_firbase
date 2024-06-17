import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseecom/admin/category/edit_category.dart';
import 'package:firebaseecom/admin/product/edit_product.dart';
import 'package:firebaseecom/constant/colors.dart';
import 'package:firebaseecom/controller/admin/show_cat.dart';
import 'package:firebaseecom/controller/admin/show_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowCategory extends StatelessWidget {
  const ShowCategory({super.key});

  @override
  Widget build(BuildContext context) {
    ShowCategoryController controller=Get.put(ShowCategoryController());
    return GetBuilder<ShowCategoryController>(builder: (controller){
      return Scaffold(
        backgroundColor: AppColor.grey,
        appBar: AppBar(
          title: Text("All Categores",style: TextStyle(fontSize: 26),),
          centerTitle: true,
        ),
        body:  Container(
      margin: EdgeInsets.all(20),
                  child:FutureBuilder<QuerySnapshot>(
                    future:FirebaseFirestore.instance.collection("categorey").get() ,
                    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                      if (snapshot.hasError) {return Center(child:Text('Error Try Again') ,);}
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return  Center(child:CircularProgressIndicator(color: Colors.blue,));
                      }
                      if(snapshot.hasData){
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context,index){
                              return
                                Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child:ListTile(
                                      title: Text("${controller.categorey[index]["categorytName"]}",style: TextStyle(fontSize: 18),),
                                      
                                      leading: IconButton(onPressed: (){
                                        Get.to(()=>EditCategory(),arguments: [controller.docId[index],controller.categorey[index]]);
                                      }, icon: Icon(Icons.edit,color: Colors.blueAccent,)),
                                      trailing:
                                      IconButton(icon: Icon(Icons.delete,color: Colors.red,),onPressed: ()async{
                                        
                                        var collection = FirebaseFirestore.instance
                                            .collection('categorey');
                                        var querySnapshots = await collection.get();

                                        collection.doc(controller.docId[index]).delete().then((value){
                                          controller.getProductToDelete(controller.categorey[index]["categorytName"]);
                                          
                                        });
                                      },)
                                  ) ,
                                );



                          },);
                      }
                      return Text("");
                    },
                  ))
           ,
      );
    });
  }
}