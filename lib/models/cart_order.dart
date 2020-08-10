// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_commerce_project/features/user/Repositories/db_product.dart';
// class CartModel{
//   int id;
//   String userId;
//   String traderId;
//   String productId;
//   String imageUrlProduct;
//   String titleProduct;
//   double price;
  
  

//   CartModel({
//        this.userId,
//        this.traderId,
//        this.productId,
//        this.imageUrlProduct,
//        this.titleProduct,
//        this.price
//        });

//   CartModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot){
//     this.id = documentSnapshot.documentID;
//     this.userId = documentSnapshot.data['userId'];
//     this.traderId = documentSnapshot.data['traderId'];
//     this.productId = documentSnapshot.data['productId'];
//     this.imageUrlProduct = documentSnapshot.data['userId'];
//     this.titleProduct = documentSnapshot.data['titleProduct'];
//     this.price = documentSnapshot.data['price'];
//   }

  
  

//   toJson(){
//     return{
//       DBProduct.idUserColumn : this.userId,
//       DBProduct.idTraderColumn : this.traderId,
//       DBProduct.idProductColumn : this.productId ,
//       DBProduct.imagUrlProductColumn : this.imageUrlProduct ,
//       DBProduct.titleProductColumn : this.titleProduct ,
//       DBProduct.priceProductColum : this.price ,
//     };
//   }
// }