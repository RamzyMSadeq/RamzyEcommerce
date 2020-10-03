import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/features/admin/providers/admin_provider.dart';
import 'package:e_commerce_project/features/user/Provider/e_c_provider.dart';
import 'package:e_commerce_project/features/user/ui/Screens/ProductProfile.dart';
import 'package:e_commerce_project/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatefulWidget {
  
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
   List<ProductModel> listProduct1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Explore'),
        centerTitle: true,
        elevation: 0,
        backgroundColor:style.Colors.mainColor ,
      ),

      body: Consumer2<AdminProvider , ECProvider>(
        builder: (context, value,value2 ,child) {
          value.getAllProducts();
          if(value2.search2 ==""){
            listProduct1 = value.allProducts;
          }
          else{
            listProduct1 = value2.searchProduct;
          }
           

          if(listProduct1 == null){
             return Center(
               child: Text('No Products Found'),
             );
          }else{
            return Column(
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
                left: 30,
                bottom: -30,
                child: Container(
                  width: ScreenUtil().setWidth(350),
                  height: ScreenUtil().setHeight(60),
                  decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(25)),
                   
                  ),
                  child: TextField(
                    onChanged: (valueSearch){
                       value2.getSearchProducts(valueSearch);
                       value2.setSearch(valueSearch);
                       listProduct1 = value2.searchProduct;
                       print("asdfghfdsasdfghjfds ${listProduct1.length}");
                    },
                    decoration: InputDecoration(
                      hintText: 'Search a Product , Stor , type',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      
                      filled: true,
                      fillColor: style.Colors.titleColor

                    ),
                  ),
                )
              )
              ],
            ),
            SizedBox(height: 29,),
            Container(
              height: ScreenUtil().setHeight(70),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listProduct1.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
              height: ScreenUtil().setHeight(50),
              width: ScreenUtil().setWidth(100),
              decoration: BoxDecoration(
                color: style.Colors.titleColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35)
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey.withOpacity(.2),
                    
                  )


                ]
              ),
              child: Center(child: Text(listProduct1[index].category),),
            );
                },)
            ),
            Container(
              height: ScreenUtil().setHeight(555),
              //color: Colors.red,
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: listProduct1.length,
                 itemBuilder: (context, index) {
                   return GestureDetector(
                     onTap: (){

                       Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration:Duration(milliseconds: 1000) ,

                        pageBuilder: (context , _ , __)=>ProductProfile(
                        
                        productDe:listProduct1[index] ,
                        index1:index ,
                        hero: 'myHero',
                      ) )
                    );

                     },
                     child: Hero(
                       tag:'myHero'+index.toString() ,
                       child: Container(
                       margin: EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
                       height: 200,
                       width: 200,
                       //color: Colors.amber,
                       decoration: BoxDecoration(
                         image: DecorationImage(
                           image: CachedNetworkImageProvider(listProduct1[index].imageUrl),
                           fit: BoxFit.cover
                         )

                       ),
                       
                 ),
                     ),
                   );
                 },
                 staggeredTileBuilder: (index) {
                   return StaggeredTile.count(2, index.isEven ? 3 : 2);
                 },
                 //mainAxisSpacing: 3.0,
                 //crossAxisSpacing: 3.0,
                 )
            )
          ],
        );
          }
          
        },
            
      ),
      
      
      
      
    );
  }
}