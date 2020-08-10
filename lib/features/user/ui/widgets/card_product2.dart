import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/features/admin/providers/admin_provider.dart';
import 'package:e_commerce_project/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CardWidget2 extends StatelessWidget {
  ProductModel product;
  CardWidget2(this.product);
  @override
  Widget build(BuildContext context) {
    
    return Consumer<AdminProvider>(
      builder: (context, value, child) {
        
        return Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20 , top: 10 ),
              height: ScreenUtil().setHeight(270),
              width: ScreenUtil().setWidth(180),
              decoration: BoxDecoration(
                color:style.Colors.mainColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(40)
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 12,
                    color: Colors.grey[800],
                    offset: Offset(0, 6)
                  )
                ]
              ), 

        ),
        Container(
          alignment: Alignment.topCenter,
             margin: EdgeInsets.only(left: 19 , top: 10),
              height: ScreenUtil().setHeight(160),
              width: ScreenUtil().setWidth(182),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(image: CachedNetworkImageProvider(product.imageUrl) 
                , fit:BoxFit.cover )
              ), 
        ), 

        Container(
          margin: EdgeInsets.only(left: 19 , top: 160),
              height: ScreenUtil().setHeight(130),
              width: ScreenUtil().setWidth(182),

          child: Column(
            children: <Widget>[
              
              Container(
                margin: EdgeInsets.only(top: 10),
                width: ScreenUtil().setWidth(160),
                
                child: Text(product.title , textAlign: TextAlign.start, 
                style: GoogleFonts.poppins(
                          color: style.Colors.titleColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                ),
                

              ),
              product.rating != null
              ?
               Container(
                margin: EdgeInsets.only(top: 10),
                width: ScreenUtil().setWidth(160),
                 
                child: SmoothStarRating(
            allowHalfRating: true,
            onRated: (v) {
             },
            starCount: 5,
            rating: product.rating,
            size: 20.0,
            isReadOnly:true,
            color: Colors.yellow[600],
            borderColor: Colors.grey,
            spacing:0.0
    )
            
              ) : SizedBox(height: 5,),
              

              Container(
                //margin: EdgeInsets.only(top: 10),
                width: ScreenUtil().setWidth(160),
                 
                child: Text('${product.price}' , 
                style: GoogleFonts.poppins(
                          color: style.Colors.secondColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                ),
            
              ),
              Container(
               // margin: EdgeInsets.only(top: 10),
                width: ScreenUtil().setWidth(160),
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                     Text('${product.price}' , textAlign: TextAlign.start, 
                          style: GoogleFonts.poppins(
                          color: style.Colors.titleColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                          ),
                          

                ),

                    Text('${product.discount} % off' , textAlign: TextAlign.start, 
                          style: GoogleFonts.poppins(
                          color: style.Colors.secondColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),

                ),


                  ],
                )
            
              ),
            ],
          ),
        ),



            
          ],
    );
      },
    );
  }
}