import 'package:e_commerce_project/features/user/ui/Screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme.dart' as style;
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedItem=0;
  List<Widget> myScreens = [
    HomeScreen(),
    Container(color: Colors.amber,),
    Container(color: Colors.red,),
    Container(color: Colors.blue,),
    Container(color: Colors.deepOrange,),
  ];

  changingTab(int index){
    setState(() {
      selectedItem = index;
    });
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:style.Colors.secondColor ,

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