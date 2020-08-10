import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProfileUserAbout extends StatelessWidget {
  double lat;
  double long;
  ProfileUserAbout(this.lat , this.long);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,

      child: Column(
        children: <Widget>[
          Container(
            height: 250,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(lat, long),
              zoom: 15
              )),
          ),
          Container(
            height: 80,
            
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20 , top: 10),
                  alignment: Alignment.topLeft,
                  child: Text("About Me".toUpperCase() , style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 15
                  ))),
                  Container(
                  margin: EdgeInsets.only(left: 20 ),
                  alignment: Alignment.topLeft,
                  child: Text("Location \\ Al-jalaa section with Ahmad ebn Abd Alaziz St. \\ Near JAWAL Co." , style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13
                  ))),

              ],
            ),
          ),

          Container(
            height: 380,
            
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20 ),
                  alignment: Alignment.topLeft,
                  child: Text("contact us".toUpperCase() , style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 15
                  ))),

                  Container(
                    height: 55,
                    width: 370,
                    child: TextField(
                      
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFECEFF6),
                        hintText: "Name",
                        border: OutlineInputBorder(),
                        
                      ),
                    ),
                  ),
                   Container(
                    height: 55,
                    width: 370,
                    child: TextField(
                      
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFECEFF6),
                        hintText: "Email Address",
                        border: OutlineInputBorder(),
                        
                      ),
                    ),
                  ),
                   Container(
                    
                    height: 100,
                    width: 370,
                    child: TextField(
                      maxLines: 10,
                      
                      decoration: InputDecoration(
                        
                        filled: true,
                        fillColor: Color(0xFFECEFF6),
                        hintText: "Message",
                        border: OutlineInputBorder(),
                        
                      ),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 370,
                    
                    decoration: BoxDecoration(
                      color: style.Colors.mainColor,
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: FlatButton(
                      onPressed: (){},
                       child: Text("send message".toUpperCase() )
                       )
                  ),
                  

              ],
            ),
          ),
        ],
      ),
      
    );
  }
}