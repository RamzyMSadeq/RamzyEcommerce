import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_project/features/admin/repositories/admin_client.dart';
import 'package:e_commerce_project/models/product_model.dart';
import 'package:e_commerce_project/models/userModel.dart';

class AdminRepository{

  AdminRepository._();

  static final AdminRepository adminRepository = AdminRepository._();



  Future<List<ProductModel>> getAllProducts()async{
   try{
     List<DocumentSnapshot> resultList = await AdminClient.adminClient.getAllProduct();
    
   List<ProductModel> products = 
     resultList.map((e) => ProductModel.fromDocumentSnapshot(e)).toList();
     return products;

   }catch(error){
     print(error);
   }

  }

  Future<ProductModel> getProductById(ProductModel prm)async{
    try{
      DocumentSnapshot documentSnapshot= await AdminClient.adminClient.getProductById(prm);
    ProductModel productModel = ProductModel.fromDocumentSnapshot(documentSnapshot);

    return productModel;

    }catch(error){
      print(error);
      
    }
  }
  Future<List<UserModel>> getProductByUserId(String userId)async{
    try{
      List<DocumentSnapshot> docSP= await AdminClient.adminClient.getUserByUserId(userId);
      
    List<UserModel> myList =  docSP.map((e) => UserModel.fromDocumentSnapshot(e)).toList();      
    return myList;
    }catch(error){
      print(error);
      
    }
  }

 Future<List<ProductModel>> getMyProduct(String pId)async{
    try{
    List<DocumentSnapshot> result = await AdminClient.adminClient.getMyProduct(pId);
    
    List<ProductModel> myList = result.map((e) => ProductModel.fromDocumentSnapshot(e)).toList();
    print("waasasasa ${myList.length}");
    return myList;

    }catch(error){
      print(error);
      
    }
  }



}