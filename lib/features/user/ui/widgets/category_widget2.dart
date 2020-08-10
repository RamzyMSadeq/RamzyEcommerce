import 'package:e_commerce_project/style/theme2.dart' as style;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



class CategoryWidget2 extends StatelessWidget {
  
List<String> listNameCategory = [
  'Man Shirt',
  'Dress',
  'Woman\n Shirt',
  'Woman Bag',
  'Man Shoes',
  'High Heels'
];
List<String> listNameImg = [
  'assets/images/menshirt.png',
  'assets/images/dresscategory.png',
  'assets/images/womenshirt.png',
  'assets/images/bagcategory.png',
  'assets/images/shoescaterory.png',
  'assets/images/heelscategory.png'
];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(150),
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
                        color: style.Colors.mainColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'More Category',
                    style: GoogleFonts.poppins(
                        color: style.Colors.secondColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
              ],
            ),
          ),

          Container(
            height: ScreenUtil().setHeight(110),
            
            child: ListView.builder(
              
              scrollDirection: Axis.horizontal,
            itemCount:listNameCategory.length ,

            itemBuilder: (context , index){
              return Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                margin: EdgeInsets.only(left: 20 , top: 10 , bottom: 10),
                height: 130,
                width: 90,
                decoration: BoxDecoration(
                  //color: style.Colors.titleColor,
                  image: DecorationImage(image: AssetImage(listNameImg[index] ), fit: BoxFit.fill),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 7,
                      color: Colors.grey[700],
                      offset: Offset(1, 2)

                    )
                  ]
                ),

              ),
              Container(
                 margin: EdgeInsets.only(left: 20 , top: 10 , bottom: 10),
                height: 130,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.black45,

                ),
                child: Container(
                  width: 70,
                  child: Center(
                    child: Text(listNameCategory[index] ,
                    style: GoogleFonts.poppins(
                          color: style.Colors.titleColor.withOpacity(.7),
                          fontSize: 12,
                          fontWeight: FontWeight.w600), ),
                  ),
                ),

              )
              

                ],
              );
            }
            ),
          )

          


          

        ],
      ),


      
    );
  }
}