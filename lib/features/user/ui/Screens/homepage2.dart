import 'package:e_commerce_project/features/user/ui/Screens/exploreScreen.dart';
import 'package:e_commerce_project/features/user/ui/Screens/home_screen2.dart';
import 'package:e_commerce_project/features/user/ui/Screens/profile_user.dart';
import 'package:e_commerce_project/features/user/ui/Screens/shopping_cart.dart';
import 'package:e_commerce_project/features/user/ui/Screens/super_splash_sale.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {


   int selectedItem=0;
   List<Widget> myScreens = [
    HomeScreen2(),
    //Container(color: Colors.white,),
    ExploreScreen(),
    ShoppingCart(),
    //Container(color: Colors.amber,),
    //Container(color: Colors.red,),
    //Container(color: Colors.blue,),
    SuperSplashSale(nameurl: 'assets/images/shoescaterory.png', myHero: 'f',),
    //Container(color: Colors.deepOrange,),
    ProfileUser(),
  ];
  changingTab(int index){
    setState(() {
      selectedItem = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.Colors.titleColor,
      

      body: myScreens.elementAt(selectedItem),





      


      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: style.Colors.hintColor,
        
        items: [
          BottomNavigationBarItem(
            //backgroundColor: style.Colors.hintColor,
            icon: Icon(Icons.home ),
            title: Text('Home' , style: GoogleFonts.poppins(
                      //color: style.Colors.titleColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),)
                      
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.search ),
            title: Text('Explore' , style: GoogleFonts.poppins(
                      //color: style.Colors.titleColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),)
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart ),
            
            title: Text('Cart' , style: GoogleFonts.poppins(
                      //color: style.Colors.titleColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),)
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.local_offer ),
            title: Text('Offer' , style: GoogleFonts.poppins(
                      //color: style.Colors.titleColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),)
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person_outline ),
            title: Text('Account' , style: GoogleFonts.poppins(
                      //color: style.Colors.titleColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),)
            ),
        ],
        currentIndex: selectedItem,
        selectedItemColor: style.Colors.mainColor,
        unselectedItemColor: style.Colors.hintColor,
        onTap: (value){
          changingTab(value);

        },
        ),

      



       
      
    );
  }
}