import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;

class ProfileMyStore extends StatelessWidget {
   List<String> listNameStore = [
  'Super\nMarket',
  'Clothes',
  'shoes',
  'electronics',
  'computer',
  'mobile'
];
List<String> storeUrl = [
  'assets/images/almahdi.jpg',
  'assets/images/tabone.jpg',
  'assets/images/mazaj.jpg',
  'assets/images/meatcity.jpg',
  'assets/images/capital.jpg',
  'assets/images/metro.jpg',
];
List<String> storeName = [
  'Jawad Mahdi Store',
  'Al Tabone',
  'MazaJ',
  'Meat City',
  'Capital Mall',
  'Metro',
];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: ListView.builder(
        itemCount: storeUrl.length,
        itemBuilder: (context, index) {
          return Container(
            
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 130,
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    width: 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(storeUrl[index]),
                      fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30)
                      )
                    ),
                  ),
                  Container(
                    width: 200,
                    child: ListTile(
                      title: Text(storeName[index] ,
                       style: GoogleFonts.poppins(
                                  color:Colors.grey[700],
                                      fontSize: 15,
                                       fontWeight: FontWeight.w500,

              )),
              subtitle: Container(
                
                height: 40,
                width: 50,
                color: style.Colors.mainColor,
                child: Center(child: Text('UnFollow' ,style: GoogleFonts.poppins(
                                  color:Colors.white,
                                      fontSize: 14,
                                       fontWeight: FontWeight.w500,

              )),),
              ),
                    ),
                  )
                ],
              )
            ),
          );
        },
        ),

    );
  }
}