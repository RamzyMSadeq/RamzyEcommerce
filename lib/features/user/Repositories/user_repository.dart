import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_project/features/admin/repositories/admin_client.dart';
import 'package:e_commerce_project/features/user/Repositories/user_Client.dart';
import 'package:e_commerce_project/models/order_model.dart';
import 'package:e_commerce_project/models/product_model.dart';
import 'package:e_commerce_project/models/userModel.dart';

class UserRepository{

  UserRepository._();

  static final UserRepository userRepository = UserRepository._();

  Future<List<ProductModel>> getIsOfferProducts()async{
   try{
     List<DocumentSnapshot> resultList = await UserClient.userClient.getAllOfferProduct();
    
   List<ProductModel> products = 
     resultList.map((e) => ProductModel.fromDocumentSnapshot(e)).toList();
     return products;

   }catch(error){
     print(error);
   }

  }

Future<List<UserModel>> getAllStore()async{
  List<DocumentSnapshot> result = await  UserClient.userClient.getAllStor();
  List<UserModel> myList = result.map((e) => UserModel.fromDocumentSnapshot(e)).toList();
  return myList;
}


Future<List<UserModel>> getStoreById(String userId)async{
  List<DocumentSnapshot> result = await  UserClient.userClient.getStoreById(userId);
  List<UserModel> myList = result.map((e) => UserModel.fromDocumentSnapshot(e)).toList();
  return myList;
}

 Future<List<Order>> getAllOrders()async{
   try{
    List<DocumentSnapshot> result = await  UserClient.userClient.getAllOrders(); 
   List<Order> orders = result.map((e) => Order.fromDocumentSnapshot(e)).toList();
   
   return orders;

   }catch(error){
     print(error);
   }

  }

  Future<List<ProductModel>> getSearchProducts(String key)async{
   try{
     List<DocumentSnapshot> resultList = await UserClient.userClient.getProductToSearch(key);
     
    
   List<ProductModel> products = 
     resultList.map((e) => ProductModel.fromDocumentSnapshot(e)).toList();
     return products;

   }catch(error){
     print(error);
   }

  }



}