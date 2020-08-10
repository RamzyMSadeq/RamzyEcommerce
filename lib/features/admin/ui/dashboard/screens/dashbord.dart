import 'package:e_commerce_project/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

class DashBoard extends StatelessWidget {
  List<ProductModel>  myProducts;
  DashBoard(this.myProducts);
  
  
  Map<String, double> dataMap = new Map();
  List<Color> myColors=[
    style.Colors.mainColor,
    style.Colors.secondColor,
    style.Colors.secondColor,
    style.Colors.mainColor,
  ]; 
  List<String> myTitle = ['Products' , 'Followers' , 'Users' , 'Visitors'];
  List<String> myNum;

  @override
  Widget build(BuildContext context) {

    myProducts != null 
    ?
     myNum = [
      myProducts.length.toString(),
       '0' , '0' , '0'
       ]
       :
       myNum = [
      "0",
       '0' , '0' , '0'
       ];
    
    dataMap.putIfAbsent("Products" , () => 5);
    dataMap.putIfAbsent("Followers", () => 3);
dataMap.putIfAbsent("Visitors", () => 2);
dataMap.putIfAbsent("Nonvisitors", () => 2);
    return Scaffold(
      //backgroundColor: Colors.grey[300],
      backgroundColor: Color(0xFF282930),
     
      body: Container(
        child: Column(
          children: <Widget>[

            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 20 , left: 20),
              child: Text("Your Rank", style: GoogleFonts.poppins(
                color: style.Colors.titleColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,

              ),),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 10 , right: 10),
              
              height: 280,
              decoration: BoxDecoration(
                color: Color(0xFF353642),
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              
              child: PieChart(
                
        dataMap: dataMap,
        legendStyle: TextStyle(color: style.Colors.titleColor),
        animationDuration: Duration(milliseconds: 1200),
        chartLegendSpacing: 45.0,
        chartRadius: MediaQuery.of(context).size.width / 2,
        showChartValuesInPercentage: true,
        showChartValues: true,
        showChartValuesOutside: false,
        chartValueBackgroundColor: Colors.grey[200],
        colorList: [Colors.blue , Colors.green , Colors.red , Colors.yellow],
        showLegends: true,
        legendPosition: LegendPosition.right,
        decimalPlaces: 1,
        showChartValueLabel: true,
        initialAngle: 0,
        chartValueStyle: defaultChartValueStyle.copyWith(
          color: Colors.blueGrey[900].withOpacity(0.9),
        ),
        chartType: ChartType.disc,
    ),

              
            ),
         Container(
           //color: Colors.yellowAccent,
           height: 353,
           child: GridView.builder(
             itemCount: 4,
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
               childAspectRatio: 19/15
               ),
               itemBuilder:(context, index) {
                 return Container(
                   margin: EdgeInsets.all(10),
                   //height: 70,
                   width: 200,
                   decoration: BoxDecoration(
                     color: myColors[index],
                     borderRadius: BorderRadius.all(Radius.circular(30)),
                    
                   ),
                   child: Center(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Text(myNum[index], style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: style.Colors.titleColor

              ),),
                         Text(myTitle[index], style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,

              ),)
                       ],
                     )
                     ), 

                 );
               } ,
               
               ),
         )

    


          ],
        ),
      ),




      
    );
  }
}