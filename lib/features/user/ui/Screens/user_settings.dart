import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/features/user/ui/Screens/setting_birthday.dart';
import 'package:e_commerce_project/features/user/ui/Screens/setting_email.dart';
import 'package:e_commerce_project/features/user/ui/Screens/setting_gender.dart';
import 'package:e_commerce_project/features/user/ui/Screens/setting_name.dart';
import 'package:e_commerce_project/features/user/ui/Screens/setting_password.dart';
import 'package:e_commerce_project/features/user/ui/Screens/setting_phone.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UserSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting".toLowerCase()),
        elevation: 0,
        centerTitle: true,
        backgroundColor:style.Colors.mainColor ,
      ),

      body: Container(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          children: <Widget>[
            Container(
              
              height: ScreenUtil().setHeight(170),
              width: ScreenUtil().setWidth(411),
             

              child:Row(
                children: <Widget>[
                  Expanded(
                     flex: 1,
                                      child: CircleAvatar(
                      maxRadius: 40,
                      backgroundImage: CachedNetworkImageProvider('https://images.pexels.com/photos/941693/pexels-photo-941693.jpeg'),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                      child: Container(
                      height: 50,
                      child: ListTile(
                        title: Row(
                          children: <Widget>[
                            Text("Ramzy Sadeq"),
                            IconButton(icon: Icon(Icons.edit ), onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context)=>SettingName()));
                            } )
                          ],
                        ),
                        subtitle: Text("Ramzysadeq@gmail.com"),
                        

                      ),
                    ),
                  )
                ],
              ) ,
            ),
            Divider(thickness: 1,),
            ListTile(
              
              leading: Icon(Icons.person , color: style.Colors.mainColor,),
              title: Text("Gender" , style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                
                
              ),),
              trailing: Container(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Male", style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.grey
                
                
              ),),
                    IconButton(icon: Icon(Icons.navigate_next ,size: 25, ),
                     onPressed: (){
                       Navigator.of(context).push(MaterialPageRoute(
                                builder: (context)=>SettingGender()));
                     })

                  ],
                ),
              ),
              
              
            ),
            Divider(thickness: 1,),

            ListTile(
              
              leading: Icon(Icons.person , color: style.Colors.mainColor,),
              title: Text("Birthday" , style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                
                
                
              ),),
              trailing: Container(
                width: 145,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("12-12-2000", style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.grey
                
                
              ),),
                    IconButton(icon: Icon(Icons.navigate_next ,size: 25, ),
                     onPressed: (){
                       Navigator.of(context).push(MaterialPageRoute(
                       builder: (context)=>SettingBirthday()));
                     })

                  ],
                ),
              ),
              
              
            ),
            Divider(thickness: 1,),

            ListTile(
              
              leading: Icon(Icons.mail_outline , color: style.Colors.mainColor,),
              title: Text("Email" , style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                
                
              ),),
              trailing: Container(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("RamzySadeq@****", style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.grey
                
                
              ),),
                    IconButton(icon: Icon(Icons.navigate_next ,size: 25, ),
                     onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                       builder: (context)=>SettingEmail()));
                     })

                  ],
                ),
              ),
              
              
            ),
            Divider(thickness: 1,),

            ListTile(
              
              leading: Icon(Icons.phone_iphone , color: style.Colors.mainColor,),
              title: Text("Phone Number" , style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                
                
              ),),
              trailing: Container(
                width: 155,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("0597765854", style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.grey
                
                
              ),),
                    IconButton(icon: Icon(Icons.navigate_next ,size: 25, ),
                     onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                       builder: (context)=>SettingPhone()));
                     })

                  ],
                ),
              ),
              
              
            ),
            Divider(thickness: 1,),

            ListTile(
              
              leading: Icon(Icons.lock_outline , color: style.Colors.mainColor,),
              title: Text("Change Password" , style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                
                
              ),),
              trailing: Container(
                width: 110,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("••••••••", style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.grey
                
                
              ),),
                    IconButton(icon: Icon(Icons.navigate_next ,size: 25, ),
                     onPressed: (){
                       Navigator.of(context).push(MaterialPageRoute(
                       builder: (context)=>SettingPassword()));
                     })

                  ],
                ),
              ),
              
              
            ),
            Divider(thickness: 1,),

            
          ],
        ),
      ),
      
    );
  }
}