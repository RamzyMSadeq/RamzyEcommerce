
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_project/models/order_model.dart';
import 'package:e_commerce_project/models/userModel.dart';


class UserClient{

  UserClient._();

  static final UserClient userClient = UserClient._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
 // FirebaseStorage firebaseStorage = FirebaseStorage.instance;

 Future<List<DocumentSnapshot>> getAllOfferProduct()async{
   try{
     QuerySnapshot querySnapshot = await firestore
   .collection("Products")
   .where('isOffer' , isEqualTo: true)
   .get();
   
   return querySnapshot.docs;

   }catch(error){
     print(error);
   }

  }

 Future<List<DocumentSnapshot>> getAllStor()async{
   try{
    QuerySnapshot querySnapshot =  await firestore
   .collection("LogInUsers")
   .where('isAdmin' , isEqualTo: true)
   .get();

   return querySnapshot.docs;
   

   }catch(error){
     print(error);
   }

  }

 Future<List<DocumentSnapshot>> getStoreById(String userId) async{
    try{
    QuerySnapshot querySnapshot =  await firestore
   .collection("LogInUsers")
   .where('userId' , isEqualTo: userId)
   .get();

   return querySnapshot.docs;
   

   }catch(error){
     print(error);
   }
  }

   Future<String> addNewOrder(Order order)async{
    try{
     DocumentReference documentReference = await firestore
     .collection("Orders")
     .add(order.toJsone());

     return documentReference.id;
    }catch(erroe){
      print(erroe);
    }


  }

   Future<List<DocumentSnapshot>> getAllOrders()async{
   try{
     QuerySnapshot querySnapshot = await firestore
   .collection("Orders")
   .get();
   return querySnapshot.docs;

   }catch(error){
     print(error);
   }

  }
  Future<List<DocumentSnapshot>> getProductToSearch(String key)async{
   try{
    QuerySnapshot querySnapshot = await firestore
   .collection("Products")
   .where('title' , isGreaterThanOrEqualTo: key)
   .where('title' ,isLessThan: key +'z')
   .get();
   
   
   return querySnapshot.docs;

   }catch(error){
     print(error);
   }

  }

   editeUser(UserModel user)async{
    try{
      firestore
      .collection('LogInUsers')
      .doc(user.id)
      .set(user.toJson());

    }catch(error){
      print(error);
    }
  }

   updateData( String documentId,String key , dynamic value)async{
     await firestore
     .collection("LogInUsers")
     .doc(documentId)
     .update({'$key' : value});
  }

 Future<List<DocumentSnapshot>> getAllCategory()async{
   try{
     QuerySnapshot querySnapshot = await firestore
   .collection("Categories")
   .get();
   return querySnapshot.docs;

   }catch(error){
     print(error);
   }

  }

  Future<List<DocumentSnapshot>> getAllSlider()async{
   try{
     QuerySnapshot querySnapshot = await firestore
   .collection("Slider")
   .get();
   return querySnapshot.docs;

   }catch(error){
     print(error);
   }

  }

  




}