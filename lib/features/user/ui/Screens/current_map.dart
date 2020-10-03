import 'package:e_commerce_project/features/admin/ui/dashboard/screens/home_dashboard.dart';
import 'package:e_commerce_project/features/user/Provider/e_c_provider.dart';
import 'package:e_commerce_project/features/user/Provider/e_c_provider.dart';
import 'package:e_commerce_project/features/user/Repositories/handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:geolocator/geolocator.dart' as Geo;
import 'package:provider/provider.dart';

class CurrentMap extends StatefulWidget {
  String userId;
  String storeEmail;
  String storePass;
  String storeName;
  
  CurrentMap(this.userId , this.storeEmail ,this.storePass , this.storeName);
  @override
  _CurrentMapState createState() => _CurrentMapState();
}

class _CurrentMapState extends State<CurrentMap> {
   LatLng initialPostion = LatLng(31.5, 34.46667);
   Set<Marker> myMarker = {};
   GoogleMapController _controller;
   double lat=0;
   double long=0;

   getCurrentLocation() async {
    //Geo.Geolocator geolocator = Geo.Geolocator();
    Geo.Position position = await Geo.getCurrentPosition(
        desiredAccuracy: Geo.LocationAccuracy.high);
    LatLng myLocation = LatLng(position.latitude, position.longitude);
    myMarker.add(Marker(markerId: MarkerId("MyLocation"), position: myLocation));
    _controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: myLocation, zoom: 15)));
        lat = position.latitude;
        long = position.longitude;
        
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              
              height: ScreenUtil().setHeight(550),
              child: GoogleMap(
                onMapCreated: (controller) {
                  this._controller = controller;
                },
                onTap: (argument) {
                  myMarker.clear();
                   myMarker.add(Marker(markerId: MarkerId("Gps$argument") , position: argument));
                   lat = argument.latitude;
                   long = argument.longitude;
                  setState(() {
                    
                  });
                  
                  
                },
                
                markers: myMarker,
                initialCameraPosition:
                 CameraPosition(
                  target: initialPostion,
                  zoom: 15
                  )),

            ),
            SizedBox(height: 30,),
            Text("Location",style: GoogleFonts.poppins(
                 fontSize: 20,
                 fontWeight: FontWeight.w500,
                 letterSpacing: 2 

                              )),
            Container(
              margin: EdgeInsets.all(30),
              
              child: Text('Use your current location so that the user can easily reach your store',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.grey,
                 fontSize: 13,
                 fontWeight: FontWeight.w500,
                 letterSpacing: 2 

                              ))),
            Container(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                     HandlSt.handlSt.setShared(widget.userId, true , 'Admin');
                        Provider.of<ECProvider>(context , listen: false).setUserEmail(widget.storeEmail);
                      Provider.of<ECProvider>(context , listen: false).setUserPassword(widget.storePass);
                      Provider.of<ECProvider>(context , listen: false).setIsAdmin(true);
                      Provider.of<ECProvider>(context , listen: false).setLatitude(lat);
                      Provider.of<ECProvider>(context , listen: false).setLongitude(long);
                      Provider.of<ECProvider>(context , listen: false).setUserIdTest(widget.userId);
                      Provider.of<ECProvider>(context , listen: false).setUserName(widget.storeName);
                      Provider.of<ECProvider>(context , listen: false).setImgProfile('https://cdn.hipwallpaper.com/i/29/35/VzvAlh.jpg');
                      Provider.of<ECProvider>(context , listen: false).setImgCover('https://cdn.hipwallpaper.com/i/29/35/VzvAlh.jpg');
                      Provider.of<ECProvider>(context , listen: false).setAddress('');
                      Provider.of<ECProvider>(context , listen: false).setPio('');
                      Provider.of<ECProvider>(context , listen: false).setMobileNum('');
                      
                       
                        Provider.of<ECProvider>(context , listen: false).addNewUserToFirbase();
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                            builder: (context)=>HomeDashboard()), (route) => false);
                    },
                      child: CircleAvatar(
                      radius: 30,
                      backgroundColor: style.Colors.secondColor,
                      child: Icon(Icons.check , color: style.Colors.titleColor, size: 40,),
                    ),
                  ),
                  InkWell(
                    onTap: ()async{
                     await getCurrentLocation();
                    },
                  child: Container(
                      height: 60,
                      width: 180,
                      decoration: BoxDecoration(
                        color: style.Colors.mainColor,
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      child: Center(child: Text("Current Location",
                      style: GoogleFonts.poppins(
                 fontSize: 12,
                 fontWeight: FontWeight.w500,
                 letterSpacing: 2 ,
                 color: style.Colors.titleColor

                                ))),
                    ),
                  ),
                  
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15 , right: 30),
              alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: ()async{
                        HandlSt.handlSt.setShared(widget.userId, true , 'Admin');
                        Provider.of<ECProvider>(context , listen: false).setUserEmail(widget.storeEmail);
                      Provider.of<ECProvider>(context , listen: false).setUserPassword(widget.storePass);
                      Provider.of<ECProvider>(context , listen: false).setIsAdmin(true);
                      Provider.of<ECProvider>(context , listen: false).setUserIdTest(widget.userId);
                      Provider.of<ECProvider>(context , listen: false).setUserName(widget.storeName);
                      Provider.of<ECProvider>(context , listen: false).setImgProfile('https://cdn.hipwallpaper.com/i/29/35/VzvAlh.jpg');
                      Provider.of<ECProvider>(context , listen: false).setImgCover('https://cdn.hipwallpaper.com/i/29/35/VzvAlh.jpg');
                     
                     Provider.of<ECProvider>(context , listen: false).setAddress('');
                      Provider.of<ECProvider>(context , listen: false).setPio('');
                      Provider.of<ECProvider>(context , listen: false).setMobileNum('');
                      Provider.of<ECProvider>(context , listen: false).setLatitude(0);
                      Provider.of<ECProvider>(context , listen: false).setLongitude(0);



                     Provider.of<ECProvider>(context , listen: false).addNewUserToFirbase();
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                            builder: (context)=>HomeDashboard()), (route) => false);
                      },
                      child: Text("Skip",style: GoogleFonts.poppins(
                 fontSize: 13,
                 fontWeight: FontWeight.w500,
                 
                 color: Colors.grey

                                )),
                    ),
                  )
          ],
        ),
      ),
      
    );
  }
}