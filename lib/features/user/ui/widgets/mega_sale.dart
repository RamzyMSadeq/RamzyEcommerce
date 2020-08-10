import 'package:e_commerce_project/features/admin/providers/admin_provider.dart';
import 'package:e_commerce_project/features/user/ui/Screens/ProductProfile.dart';
import 'package:e_commerce_project/features/user/ui/widgets/card_product2.dart';
import 'package:e_commerce_project/models/product.dart';
import 'package:e_commerce_project/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MegaSale extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
       builder:(context, value, child) {
         value.getAllProducts();
         List<ProductModel> listProduct = value.allProducts;
          if(listProduct.isEmpty){
             return Center(
               child: Text('No Products Found'),
             );
          }else{
            return Container(
        
        width: ScreenUtil().setHeight(271),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(370),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                   Text(
                      'Mega Sale',
                      style: GoogleFonts.poppins(
                          color: style.Colors.mainColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'See More',
                      style: GoogleFonts.poppins(
                          color: style.Colors.secondColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                ],
              ),
            ),
            SizedBox(height: 10,),

            Container(
              height: ScreenUtil().setHeight(330),
              
              child: ListView.builder(
                
                scrollDirection: Axis.horizontal,
                itemCount:listProduct.length ,

              itemBuilder: (context , index){
                return GestureDetector(
                  onTap: (){

                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration:Duration(milliseconds: 1000) ,
                        
                        pageBuilder: (context , _ , __)=>ProductProfile(
                        
                        productDe:listProduct[index] ,
                        index1:index ,
                        hero: 'myHero2',
                      ) )
                    );

                  },
                    child: Hero(
                    tag: 'myHero2'+index.toString(),
                    child: CardWidget2(listProduct[index])),
                );
              }
              ),
            )

            


            

          ],
        ),

      );
          }
       } ,
    );
  }
}