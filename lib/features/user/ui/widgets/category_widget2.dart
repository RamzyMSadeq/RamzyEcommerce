import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/features/user/Provider/e_c_provider.dart';
import 'package:e_commerce_project/models/category_model.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';



class CategoryWidget2 extends StatelessWidget {
  


  @override
  Widget build(BuildContext context) {
    ECProvider ecProvider= Provider.of<ECProvider>(context);
         ecProvider.getAllCategory();
          List<CategoryModel> myCat = ecProvider.allCategory;
           
          return
          myCat != null ?
           Container(
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
              itemCount:myCat.length ,

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
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(myCat[index].imageUrl), fit: BoxFit.fill),
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
                      child: Text(myCat[index].title ,
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


        
      )
      :
      Center(child: CircularProgressIndicator(),);

        
      
  }
}