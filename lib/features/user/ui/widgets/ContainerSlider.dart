import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commerce_project/style/theme.dart' as style;

class ContainerSlider extends StatelessWidget {
  final String imgUrl;

 
  ContainerSlider({this.imgUrl });

  
  @override
  Widget build(BuildContext context) {
    

    return  Container(
      
        
        height: ScreenUtil().setHeight(200),
        child: Column(
          children: <Widget>[
            Stack(
          
          children: <Widget>[
            
              Container(
                height: ScreenUtil().setHeight(175),
                width: double.infinity,
                child: Image.asset(imgUrl , fit: BoxFit.cover,)),
            Container(
              
              margin: EdgeInsets.only( left: 20 , top: 20),
                        child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20),

               child: Text('Super Flash Sale \n50% Off' ,
              style: GoogleFonts.poppins(
                
                            color: style.Colors.secondColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                            
              ),
                ),
                SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(right: 30),

                height: ScreenUtil().setHeight(40),
                width: ScreenUtil().setWidth(150),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color:Colors.white ,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            child:Text("03" , textAlign: TextAlign.center, 
                            style:GoogleFonts.poppins(
                          //color: style.Colors.secondColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                            
                            
                            ) ,
                            
                        ),
                        Text(":" , textAlign: TextAlign.center, 
                            style:GoogleFonts.poppins(
                          color: style.Colors.secondColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                            
                            
                            ) ,
                            Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color:Colors.white ,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            child:Text("16" , textAlign: TextAlign.center, 
                            style:GoogleFonts.poppins(
                          //color: style.Colors.secondColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                            
                            
                            ) ,
                            
                        ),
                        Text(":" , textAlign: TextAlign.center, 
                            style:GoogleFonts.poppins(
                          color: style.Colors.secondColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                            
                            
                            ) ,
                            Container(
                              
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color:Colors.white ,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            child:Text("55" , textAlign: TextAlign.center, 
                            style:GoogleFonts.poppins(
                          //color: style.Colors.secondColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                            
                            
                            ) ,
                            
                        ),
                     
                    
                  ],
                ),
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