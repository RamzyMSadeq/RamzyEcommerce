import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_project/models/product_model.dart';
import 'package:e_commerce_project/models/userModel.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdminClient{

  AdminClient._();

  static final AdminClient adminClient = AdminClient._();
  Firestore firestore = Firestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<String> addNewUser(UserModel userModel)async{

    try{
     DocumentReference documentReference = await 
     firestore
     .collection("LogInUsers")
     .add(userModel.toJson());
     print("aaaaaaaaaaaaaaaaaaa ");
     return documentReference.documentID;
    }catch(error){
      print(error);
    }

  }

 
  Future<List<DocumentSnapshot>> getUserByUserId(String userId)async{
    try{
     QuerySnapshot querySnapshot = await firestore
     .collection("LogInUsers")
     .where("userId" ,isEqualTo: userId)
     .getDocuments();
     return querySnapshot.documents;

    }catch(error){
      print(error);
    }

  }

  Future<String> uploadImage(File file , String collec) async{
    try{
      DateTime dateTime = DateTime.now();
    StorageTaskSnapshot storageTaskSnapshot = await
    firebaseStorage
    .ref()
    .child('$collec/$dateTime.jpg')
    .putFile(file)
    .onComplete;

    String imageUrl = await storageTaskSnapshot.ref.getDownloadURL();
    return imageUrl;

    }catch(erroe){
      print(erroe);
    }

  }

  Future<String> addNewProduct(ProductModel product)async{
    try{
     DocumentReference documentReference = await firestore
     .collection("Products")
     .add(product.toJsone());
     return documentReference.documentID;
    }catch(erroe){
      print(erroe);
    }


  }

  Future<List<DocumentSnapshot>> getAllProduct()async{
   try{
     QuerySnapshot querySnapshot = await firestore
   .collection("Products")
   .getDocuments();
   return querySnapshot.documents;

   }catch(error){
     print(error);
   }

  }
  Future<DocumentSnapshot> getProductById(ProductModel productModel)async{
   try{
    DocumentSnapshot documentSnapshot=  await firestore
   .collection("Products")
   .document(productModel.documentId)
   .get();
   
   return documentSnapshot;

   }catch(error){
     print(error);
   }

  }

  editeProduct(ProductModel product)async{
    try{
      firestore
      .collection('Products')
      .document(product.documentId)
      .setData(product.toJsone());

    }catch(error){
      print(error);
    }
  }
 

  deleteProduct(String documentId)async{
    try{
       firestore
      .collection('Products')
      .document(documentId)
      .delete();

    }catch(error){
      print(error);
    }
  }

    Future<List<DocumentSnapshot>> getMyProduct(String userId)async{
   try{
     QuerySnapshot querySnapshot = await firestore
   .collection("Products")
   .where('storeId' , isEqualTo: userId)
   .getDocuments();
   
   return querySnapshot.documents;

   }catch(error){
     print(error);
   }

  }

 

}