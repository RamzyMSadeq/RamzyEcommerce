import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:e_commerce_project/style/theme.dart' as style;
import 'package:google_fonts/google_fonts.dart';

class CardProduct extends StatelessWidget {
  final String nameImg;
  final String title;
  final String price;
  final String priseAfter;
  final String disacount;

  CardProduct({this.nameImg , this.title , this.price , this.priseAfter ,this.disacount});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10 , top: 20),
      height: ScreenUtil().setHeight(270),
      width:ScreenUtil().setWidth(180), 

      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(color:style.Colors.hintColor)

      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            width: ScreenUtil().setWidth(160),
            child: Image.asset(nameImg , fit: BoxFit.cover,),

          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: ScreenUtil().setWidth(160),
            
            child: Text(title , textAlign: TextAlign.start, 
            style: GoogleFonts.poppins(
                      color: style.Colors.titleColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
            ),
            

          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: ScreenUtil().setWidth(160),
             
            child: Text(price , 
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
                    Text(priseAfter , textAlign: TextAlign.start, 
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

                Text(disacount , textAlign: TextAlign.start, 
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
      
    );
  }
}