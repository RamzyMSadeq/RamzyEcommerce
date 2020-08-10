import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/Services/auth_service.dart';
import 'package:e_commerce_project/features/admin/providers/admin_provider.dart';
import 'package:e_commerce_project/features/admin/ui/dashboard/screens/add_product.dart';
import 'package:e_commerce_project/features/admin/ui/dashboard/screens/dashbord.dart';
import 'package:e_commerce_project/features/admin/ui/dashboard/screens/myProducts_screens.dart';
import 'package:e_commerce_project/features/user/ui/Screens/logIn_Screen2.dart';
import 'package:e_commerce_project/features/user/ui/Screens/profile_trader.dart';
import 'package:e_commerce_project/models/product_model.dart';
import 'package:e_commerce_project/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:provider/provider.dart';

class HomeDashboard extends StatefulWidget {
  @override
  _HomeDashboardState createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> with SingleTickerProviderStateMixin{
  TabController tabController;
  int selectedPage = 1;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this ,initialIndex: 1);
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    AdminProvider adminProvider = Provider.of<AdminProvider>(context);
    adminProvider.currentUserId();
    FirebaseUser fireUser = adminProvider.currentUser;
    List<ProductModel> myProducts;
    if(fireUser!= null){
      adminProvider.getProductByUserId(fireUser.uid);
        myProducts = adminProvider.myProductsToAdmin;
    }
    UserModel myUserDetails = adminProvider.userById;
    adminProvider.getMyProduct(fireUser.uid);
    
    

    adminProvider.currentUserId();
    return Scaffold(
      backgroundColor: Color(0xFF282930),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF282930),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications_none , color: style.Colors.mainColor,), onPressed: (){})
        ],
      ),
      body: TabBarView(
        controller: tabController,
        
        children: [
          AddProduct(),
          DashBoard(myProducts),
          ProfileTrader(myUserDetails)
          // Container(color: Colors.yellowAccent,
          // child: Center(
          //   child: RaisedButton(
          //     child: Text('LogOut'),
          //     onPressed: (){
          //       AuthService.auth.logOut();
          //       Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context)=>LogInScreens()));
          //     }),
          // ),
          // ),
        ]),

        drawer: myUserDetails!=null?
        
        Drawer(
          child: Container(
            color: Color(0xFF353642),
            child: Column(
              children: <Widget>[
               UserAccountsDrawerHeader(
                 decoration: BoxDecoration(
                   color: Color(0xFF282930),
                 ),
                 currentAccountPicture: myUserDetails.imgProfile != null 
                 ?CircleAvatar(
                   backgroundImage: CachedNetworkImageProvider(myUserDetails.imgProfile),
                 )
                 :CircleAvatar(
                   backgroundColor: Colors.grey,
                 ),
                 accountName:myUserDetails.name !=null 
                 ?Text(myUserDetails.name) 
                 :Text("") ,
                  accountEmail: myUserDetails.email !=null
                  ?Text(myUserDetails.email)
                  :Text('')),

                  ListTile(
                    title: Text("My Products" ,style: TextStyle(color: Colors.white),),
                    leading: Icon(Icons.person,color: Colors.white),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>MyProductsScreens()));
                    },

                  ),
                  Divider(),

                  ListTile(
                    title: Text("Log Out",style: TextStyle(color: Colors.white)),
                    leading: Icon(Icons.exit_to_app,color: Colors.white),

                    onTap: ()async{
                      
                   AuthService.auth.logOut();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  builder: (context)=>LogInScreens()), (route) => false);
                
                    },

                  ),

              ],
            ),
          ),
        )
        :
        Drawer(),
        

      
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Color(0xFF282930),
      
        
        currentIndex: selectedPage,
        onTap: (value) {
          tabController.animateTo(value);
          selectedPage = value;
          setState(() {
            
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add) ,title: Text('add')),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard) ,title: Text('Dashboard')),
          BottomNavigationBarItem(icon: Icon(Icons.person) ,title: Text('Profile')),
        ]),

      
    );
  }
}