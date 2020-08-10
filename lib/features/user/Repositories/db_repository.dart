import 'package:e_commerce_project/features/user/Repositories/db_product.dart';
import 'package:e_commerce_project/models/cart_model.dart';

class DBRepository{

  DBRepository._();

 static final DBRepository dbRepository = DBRepository._();

 insertNewProductCart(CartModel product)async{
   await DBProduct.dbProduct.insertDB(product.toJson());
   print('insert');

 }
 

 Future<List<CartModel>> getAllCart()async{
   List<Map<String, dynamic>> result= await DBProduct.dbProduct.getProductDB();
   List<CartModel> listAll= result.map((e) => CartModel.fromJson(e)).toList();
   return listAll;

 }

  Future<int> deleteProductCart(CartModel product) async {
    print('delete3');
    int x = await DBProduct.dbProduct.deleteproduct(product.id);
    print('delete7');
    return x;
  }


  deleteAllProductsCart() async {
    await DBProduct.dbProduct.deleteAllProductCart();
  }


}