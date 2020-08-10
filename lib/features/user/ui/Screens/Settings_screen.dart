import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/features/user/ui/Screens/user_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _lights =false;
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
                        backgroundImage: CachedNetworkImageProvider('https://images.pexels.com/photos/941693/pexels-photo-941693.jpeg'),
                      maxRadius: 40,
                      
                    ),
                  ),
                  Expanded(
                    flex: 4,
                      child: Container(
                      height: 50,
                      child: ListTile(
                        title: Text("Ramzy Sadeq"),
                        subtitle: Text("Ramzysadeq@gmail.com"),
                      ),
                    ),
                  )
                ],
              ) ,
            ),
            Divider(thickness: 1,),
            Container(
              margin: EdgeInsets.only(left: 18),
              alignment: Alignment.topLeft,
              child: Text('USER SETTINGS', style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),),
            ),
            Container(
              alignment: Alignment.topLeft,
              
              child: ListTile(
                onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>UserSettings()));
                },
                title: Text("Profile Settings", style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),),
              leading: Icon(Icons.person),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              
              child: ListTile(
                onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>UserSettings()));
                },
                title: Text("Delete Acounts", style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),),
              leading: Icon(Icons.delete),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              
              child: ListTile(
                onTap: (){
                },
                title: Text("Account verification", style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),),
              leading: Icon(Icons.mail),
              ),
            ),
            Divider(),
            Container(
              margin: EdgeInsets.only(left: 18),
              alignment: Alignment.topLeft,
              child: Text('APP SETTINGS', style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),),
            ),
            Container(
              alignment: Alignment.topLeft,
              
              child: ListTile(
                onTap: (){
                },
                title: Text("Language", style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),),
              leading: Icon(Icons.language),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              
              child: MergeSemantics(
               child: ListTile(
               title: Text('Notifications', style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),),
              leading: Icon(Icons.notifications_active),
               trailing: CupertinoSwitch(
                activeColor: style.Colors.mainColor,
               value: _lights,
               onChanged: (bool value) {
                  setState(() {
                     _lights = value; });
                      },
                  ),
              onTap: () { setState(() { _lights = !_lights; }); },
  ),
)
            ),
            Divider(),
            Container(
              margin: EdgeInsets.only(left: 18),
              alignment: Alignment.topLeft,
              child: Text('ABOUT APP', style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),),
            ),
            Container(
              alignment: Alignment.topLeft,
              
              child: ListTile(
                onTap: (){
                  
                },
                title: Text("Informations", style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),),
              leading: Icon(Icons.info),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              
              child: ListTile(
                onTap: (){
           
                },
                title: Text("Support", style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),),
              leading: Icon(Icons.info_outline),
              ),
            ),




          ],
        ),
      ),
      
    );
  }
}