import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/features/admin/providers/admin_provider.dart';
import 'package:e_commerce_project/features/user/ui/Screens/ProductProfile.dart';
import 'package:e_commerce_project/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ProfileFavorite extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
      builder: (context, value, child) {
        value.getAllProducts();
         List<ProductModel> listProduct = value.allProducts;
          if(listProduct.isEmpty){
             return Center(
               child: Text('No Products Found'),
             );
          }else{
            return Container(
        color: Colors.grey[300],
              height: ScreenUtil().setHeight(555),
              //color: Colors.red,
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: listProduct.length,
                 itemBuilder: (context, index) {
                   return GestureDetector(
                     onTap: (){

                       Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration:Duration(milliseconds: 1000) ,

                        pageBuilder: (context , _ , __)=>ProductProfile(
                        
                        productDe:listProduct[index] ,
                        index1:index ,
                        hero: 'myHero3',
                      ) )
                    );

                     },
                     child: Stack(
                       children: <Widget>[
                         Hero(
                       tag:'myHero3'+index.toString() ,
                       child: Container(
                       margin: EdgeInsets.symmetric(horizontal: 5 ,vertical: 5),
                      // height: 200,
                      // width: 200,
                       //color: Colors.amber,
                       decoration: BoxDecoration(
                         image: DecorationImage(
                           image: CachedNetworkImageProvider(listProduct[index].imageUrl),
                           fit: BoxFit.cover
                           )

                       ),
                       
                 ),
                     ),
                     Positioned(
                       child: IconButton(
                       icon: Icon(Icons.favorite ,
                        size: 35,
                        color: Colors.red,), onPressed: (){}))
                       ],
                     )
                   );
                 },
                 staggeredTileBuilder: (index) {
                   return StaggeredTile.count(2, index.isOdd ? 2 : 3);
                 },
                 //mainAxisSpacing: 3.0,
                 //crossAxisSpacing: 3.0,
                 )
            );
          }
      },
    );
  }
}