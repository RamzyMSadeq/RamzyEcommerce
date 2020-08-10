import 'package:e_commerce_project/features/admin/providers/admin_provider.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingPhone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Number".toLowerCase()),
        elevation: 0,
        centerTitle: true,
        backgroundColor:style.Colors.mainColor ,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
             
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(370),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                     alignment: Alignment.topLeft,
                    child: Text('Phone Number', style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,

              ),)),
                  Container(
                    
                    height: 50,   
                    child: TextField(
                      style: TextStyle(
                        fontSize: 15
                      ),
                      decoration: InputDecoration(
                        
                        filled: true,
                        fillColor: Color(0xFFECEFF6),
                        hintText: "+972597765854",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone_iphone),
                        
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: ScreenUtil().setHeight(580), 
            ),
            Container(
                height: 60,
                width: 400,
                color: style.Colors.mainColor,
                child: FlatButton(
                  onPressed: () async{
                   
                  },
                 child: Text("Save", style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: style.Colors.titleColor

              ),)
                 ),
              ),
          ],
        ),
      ),
      
    );
  }
}