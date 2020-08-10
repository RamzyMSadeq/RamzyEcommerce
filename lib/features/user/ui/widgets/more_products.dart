import 'package:e_commerce_project/features/admin/providers/admin_provider.dart';
import 'package:e_commerce_project/features/user/ui/Screens/ProductProfile.dart';
import 'package:e_commerce_project/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:provider/provider.dart';

import 'card_product2.dart';


class MoreProducts extends StatelessWidget {
  ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return 
      Consumer<AdminProvider>(
        builder: (context, value, child) {
          value.getAllProducts();
          List<ProductModel> listProduct = value.allProducts;
          
          if(listProduct==null){
             return Center(
               child: Text('No Products Found'),
             );
          }else{
            return Column(
          children: <Widget>[
            
            Container(
              margin: EdgeInsets.only(left: 20 , bottom: 20),
              alignment: Alignment.topLeft,
              child: Text('More Products' , style: GoogleFonts.poppins(
                          color: style.Colors.mainColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),),
            ),



            Container(
          height: 600,
          child: GridView.builder(
            itemCount:listProduct.length ,
             
            
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2 , childAspectRatio: 19/28),
             itemBuilder: (context , index){
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
                    child: Hero(
                    tag: 'myHero3'+index.toString(),
                    child: CardWidget2(listProduct[index])),
                );
                
                
             }
             ),
        )
          ],
        );

          }
          
        },
      );
    
  }
}