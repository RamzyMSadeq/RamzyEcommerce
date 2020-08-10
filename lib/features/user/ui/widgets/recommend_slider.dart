import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commerce_project/style/theme.dart' as style;

class RecommendSlider extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String subTitle;
  RecommendSlider({this.imgUrl ,this.title , this.subTitle});

  
  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: ScreenUtil().setHeight(250),
      width: ScreenUtil().setWidth(370),
      child: Column(
        children: <Widget>[
          Stack(
        
        children: <Widget>[
          Image.asset(imgUrl , fit: BoxFit.cover,width: 395,),
          Container(
            
            margin: EdgeInsets.only(top: 60),
                      child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20),

             child: Text(title,
            style: GoogleFonts.poppins(
              
                          color: style.Colors.secondColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                          
            ),
              ),
              SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(right: 50),

              height: ScreenUtil().setHeight(40),
              width: ScreenUtil().setWidth(180),
              child: Text(subTitle , 
              style: GoogleFonts.poppins(
              
                          color: style.Colors.secondColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
              
              )
            )
            ],),
          )
        ],
      ),
        ],
      )
      
    );
  }
}