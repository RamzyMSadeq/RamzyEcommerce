import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commerce_project/style/theme.dart' as style;

List<String> listImageUrl = [
  'assets/images/shirt.png',
  'assets/images/shirt.png',
  'assets/images/shirt.png',
  'assets/images/shirt.png',
  'assets/images/shirt.png',
  'assets/images/shirt.png',
];
List<String> listNameCategory = [
  'Man Shirt',
  'Dress',
  'Man Work Equipment',
  'Woman Bag',
  'Man Shoes',
  'High Heels'
];


class CategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(200),
      //width: ScreenUtil().setWidth(400),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(370),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                 Text(
                    'Category',
                    style: GoogleFonts.poppins(
                        color: style.Colors.titleColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'More Category',
                    style: GoogleFonts.poppins(
                        color: style.Colors.mainColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
              ],
            ),
          ),

          Container(
            height: ScreenUtil().setHeight(150),
            
            child: ListView.builder(
              
              scrollDirection: Axis.horizontal,
            itemCount:listImageUrl.length ,

            itemBuilder: (context , index){
              return Container(
                padding: EdgeInsets.only(left: 15),
                              child: Column(
                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      
                      height: ScreenUtil().setHeight(70),
                      width: ScreenUtil().setWidth(73),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: style.Colors.hintColor),
                        
                        
                      ),
                      child: Center(
                        child:Image.asset(listImageUrl[index]) ,)
                    ),

                    Container(
                      width: ScreenUtil().setWidth(75),

                      child: Text(listNameCategory[index] , textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: style.Colors.hintColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                          
                      ),
                    )
                  ],
                ),
              );
            }
            ),
          )

          


          

        ],
      ),


      
    );
  }
}