import 'package:e_commerce_project/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:e_commerce_project/style/theme.dart' as style;
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CardWithRating extends StatelessWidget {
    final Product product;

  CardWithRating(this.product);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.only(left: 10 , top: 20 , right: 10),
      //height: ScreenUtil().setHeight(400),
      width:ScreenUtil().setWidth(180), 
      //height:ScreenUtil().setHeight(300),

      decoration: BoxDecoration(
       // color: Colors.red,
        
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(color:style.Colors.hintColor)

      ),
      child: Container(
        //height:ScreenUtil().setHeight(300),
        
        //color: Colors.blue,
        child: Column(
          
          children: <Widget>[
            
            Container(
              margin: EdgeInsets.only(top: 10),
              
              width: ScreenUtil().setWidth(160),
              child: Image.asset(product.image , fit: BoxFit.cover,),

            ),
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
              margin: EdgeInsets.only(top: 10),
              width: ScreenUtil().setWidth(160),
               
              child: Text('${product.price}' , 
              style: GoogleFonts.poppins(
                        color: style.Colors.mainColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
              ),
          
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: ScreenUtil().setWidth(160),
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Text('${product.priceAfter}' , textAlign: TextAlign.start, 
                        style: GoogleFonts.poppins(
                        color: style.Colors.hintColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),

              ),
              Positioned(
                bottom: 8,
                            child: Text('______' , style: TextStyle(
                              color: style.Colors.hintColor
                            ), 
                
),
              )
                    ],

                  ),

                  Text('${product.disacount} % off' , textAlign: TextAlign.start, 
                        style: GoogleFonts.poppins(
                        color: Colors.red,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),

              ),


                ],
              )
          
            ),
          ],
        ),
      ),
      
    );
  }
}