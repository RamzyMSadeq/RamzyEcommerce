import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/Services/auth_service.dart';
import 'package:e_commerce_project/features/admin/providers/admin_provider.dart';
import 'package:e_commerce_project/features/admin/repositories/admin_client.dart';
import 'package:e_commerce_project/features/user/Provider/e_c_provider.dart';
import 'package:e_commerce_project/features/user/ui/Screens/Settings_screen.dart';
import 'package:e_commerce_project/features/user/ui/Screens/allOrders.dart';
import 'package:e_commerce_project/features/user/ui/Screens/all_store.dart';
import 'package:e_commerce_project/features/user/ui/Screens/exploreScreen.dart';
import 'package:e_commerce_project/features/user/ui/Screens/logIn_Screen2.dart';
import 'package:e_commerce_project/features/user/ui/widgets/category_widget2.dart';
import 'package:e_commerce_project/features/user/ui/widgets/flash_sale.dart';
import 'package:e_commerce_project/features/user/ui/widgets/mega_sale.dart';
import 'package:e_commerce_project/features/user/ui/widgets/more_products.dart';
import 'package:e_commerce_project/features/user/ui/widgets/recommended_product.dart';
import 'package:e_commerce_project/features/user/ui/widgets/slider_Home.dart';
import 'package:e_commerce_project/models/product_model.dart';
import 'package:e_commerce_project/models/userModel.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class HomeScreen2 extends StatelessWidget {

 
  @override
  Widget build(BuildContext context) {
    Provider.of<ECProvider>(context , listen: false).getAllCart();
    Provider.of<AdminProvider>(context , listen: false).currentUserId();
    Provider.of<AdminProvider>(context , listen: false).getAllProducts();
    List<ProductModel> myListTest = Provider.of<AdminProvider>(context ).allProducts;
    User fireUser = Provider.of<AdminProvider>(context , listen: false).currentUser;
      if(fireUser != null){
    Provider.of<AdminProvider>(context , listen: false).getProductByUserId(fireUser.uid);

      }
          UserModel myUserDetails = Provider.of<AdminProvider>(context , listen: false).userById;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        elevation: 0,
        backgroundColor:style.Colors.mainColor ,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications_none), onPressed: (){}),
          IconButton(icon: Icon(EvaIcons.search), onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context)=>ExploreScreen()));
          }),
          
        ],
        leading: Builder(
          builder:  (context) {
            return IconButton(
          icon: Icon(EvaIcons.menu2Outline),
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
          },)
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
              height: ScreenUtil().setHeight(70),
              width: double.infinity,
              color: style.Colors.mainColor,
            ),
            Positioned(

              left: 40,
              bottom: -30,
              
              child: Container(
                width: 330,
                height: 71,
                decoration: BoxDecoration(
                  color: style.Colors.titleColor,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 12,
                      color: Colors.grey
                    )
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(icon: 
                        Icon(Icons.store , size: 35, color: style.Colors.mainColor,),
                         onPressed: (){
                            Navigator.of(context).push(PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 800),
                    //opaque: true,

                    pageBuilder: (context,_,__)=>AllStore(),
                    transitionsBuilder:
                     (_,Animation<double> animation , Animation<double> secondaryAnimation, Widget child){
                          return FadeTransition(
                            opacity: animation,
                            child: Align(
                child: SizeTransition(
                  sizeFactor: animation,
                  child: child,
                ),
              ),
                            );
                    }
                    
                    ));

                         }),
                        Text('All Store' , style: GoogleFonts.poppins(
                      color: Colors.grey[700],
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
                      
                      ],
                    ),
                    VerticalDivider(thickness: 2, endIndent: 10, indent: 10,),


                
                         Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          
                          IconButton(icon: 
                            Icon(Icons.shopping_basket , size: 35, color: style.Colors.mainColor,),
                             onPressed: (){
                               Navigator.of(context).push(PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 800),
                    //opaque: true,

                    pageBuilder: (context,_,__)=>ExploreScreen(),
                    transitionsBuilder:
                     (_,Animation<double> animation , Animation<double> secondaryAnimation, Widget child){
                          return FadeTransition(
                            opacity: animation,
                            child: Align(
                child: SizeTransition(
                  sizeFactor: animation,
                  child: child,
                ),
              ),
                            );
                    }
                    
                    ));
                               
                             }),
                          
                          Text('All Product' , style: GoogleFonts.poppins(
                        color: Colors.grey[700],
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
                        
                        ],
                      ),
                    
                    VerticalDivider(thickness: 2, endIndent: 10, indent: 10,),


                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(icon: 
                        Icon(Icons.store , size: 35, color: style.Colors.mainColor,),
                         onPressed: (){
                           Navigator.of(context).push(MaterialPageRoute(
                             builder: (context)=>AllOrders()));
                         }),
                        Text('Order' , style: GoogleFonts.poppins(
                      color: Colors.grey[700],
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
                      
                      ],
                    ),
                    SizedBox(width: 1,)
                  ],
                ),
              )
              )
            ],
          ),
          SizedBox(height: 60,),
          SliderHome(),
          SizedBox(height: 10,),
          CategoryWidget2(),
          SizedBox(height: 10,),
          myListTest == null ? Center(child: CircularProgressIndicator(),) : 
         FlashSale('Flash Sale'),
         
         SizedBox(height: 10,),
          myListTest == null ? Center(child: CircularProgressIndicator(),) :
         MegaSale(),
          SizedBox(height: 30,),
         RecommProduct(),
         SizedBox(height: 10,),
          Divider(),
           myListTest == null ? Center(child: CircularProgressIndicator(),) :
          MoreProducts(),
        ],
      ),




      drawer: Drawer(
        elevation: 0,
        child: Column(
          children: <Widget>[
            Container(
              height: 230,
              child: UserAccountsDrawerHeader(

                decoration: BoxDecoration(

                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50)
                  ),
                color: style.Colors.mainColor
                ),
                accountName: myUserDetails != null ? Text('${myUserDetails.name}' , style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18
                ),)
                :
                Text(""),
                accountEmail: fireUser != null ?Text('${fireUser.email}' , style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: style.Colors.secondColor
                ),) : Text(""),
                
                
                currentAccountPicture: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider('https://images.pexels.com/photos/941693/pexels-photo-941693.jpeg')
                ),

                ),
            ),

            InkWell(
              onTap: (){},
                child: ListTile(
                title: Text("PROFILE" , style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700
                ),),
                leading: Icon(Icons.person , color: style.Colors.mainColor,size: 30,),
                trailing: IconButton(icon: Icon(Icons.navigate_next , size: 30,), onPressed: (){}),
              ),
            ),
            Divider(thickness: 1,),

            InkWell(
              onTap: (){},
                child: ListTile(
                title: Text("OFFER" , style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700
                ),),
                leading: Icon(Icons.local_offer , color: style.Colors.mainColor,size: 30,),
                trailing: IconButton(icon: Icon(Icons.navigate_next , size: 30,), onPressed: (){}),
              ),
            ),
            Divider(thickness: 1,),

            InkWell(
              onTap: (){},
                child: ListTile(
                title: Text("MY CART" , style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700
                ),),
                leading: Icon(Icons.shopping_cart , color: style.Colors.mainColor,size: 30,),
                trailing: IconButton(icon: Icon(Icons.navigate_next , size: 30,), onPressed: (){}),
              ),
            ),
            Divider(thickness: 1,),

            InkWell(
              onTap: (){},
                child: ListTile(
                title: Text("ORDERS" , style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700
                ),),
                leading: Icon(Icons.directions_car , color: style.Colors.mainColor,size: 30,),
                trailing: IconButton(icon: Icon(Icons.navigate_next , size: 30,), onPressed: (){}),
              ),
            ),
            Divider(thickness: 1,),

            InkWell(
              onTap: (){},
                child: ListTile(
                title: Text("FAVORITE" , style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700
                ),),
                leading: Icon(Icons.favorite , color: style.Colors.mainColor,size: 30,),
                trailing: IconButton(icon: Icon(Icons.navigate_next , size: 30,), onPressed: (){}),
              ),
            ),
            Divider(thickness: 1,),

            InkWell(
              onTap: (){},
                child: ListTile(
                title: Text("RECENT" , style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700
                ),),
                leading: Icon(Icons.fiber_new , color: style.Colors.mainColor,size: 30,),
                trailing: IconButton(icon: Icon(Icons.navigate_next , size: 30,), onPressed: (){}),
              ),
            ),
            Divider(thickness: 1,),
             InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>SettingsScreen()));
              },
                child: ListTile(
                title: Text("SETTINGS" , style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700
                ),),
                leading: Icon(Icons.settings , color: style.Colors.mainColor,size: 30,),
                trailing: IconButton(icon: Icon(Icons.navigate_next , size: 30,),
                 onPressed: (){
                   Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>SettingsScreen()));
                 }),
              ),
            ),
            Divider(thickness: 1,),
            InkWell(
              onTap: ()async{
                AuthService.auth.logOut();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                            builder: (context)=>LogInScreens()), (route) => false);
                    
              },
                child: ListTile(
                title: Text("SIGN OUT" , style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700
                ),),
                leading: Icon(Icons.power_settings_new , color: style.Colors.mainColor,size: 30,),
                trailing: IconButton(icon: Icon(Icons.exit_to_app , size: 30,), onPressed: (){}),
              ),
            ),
            
            

          ],
        ),
      ),
      
    );
  }
}