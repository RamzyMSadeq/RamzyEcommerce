
import 'package:e_commerce_project/features/admin/providers/admin_provider.dart';
import 'package:e_commerce_project/features/user/Provider/e_c_provider.dart';
import 'package:e_commerce_project/features/user/ui/widgets/card_Cart.dart';
import 'package:e_commerce_project/models/cart_model.dart';
import 'package:e_commerce_project/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ShoppingCart extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    ECProvider myProvider = Provider.of<ECProvider>(context );
    AdminProvider myProviderAdmin = Provider.of<AdminProvider>(context ,listen: false);
      double myTotal=1;
                 myProvider.getAllCart();
                 myTotal = myProvider.totalCart*myTotal ;
                 myProviderAdmin.currentUserId();
                 myProvider.getStoreById(myProviderAdmin.currentUser.uid);
                 
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("My Cart"),
        centerTitle: true,
        backgroundColor: style.Colors.mainColor,

      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                ClipPath(
              clipper: MyClippe(),
                      child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/8,
                      decoration: BoxDecoration(
                        
                        color: style.Colors.mainColor,
                        
                      ),
                      
                    ),
                          ),

                    Positioned(
                      bottom: -40,
                      left: 150,
                      child: Image.asset('assets/images/cart.png' , width: 100),
                    )
              ],
            ),
            SizedBox(height: 30,),
            
            Container(
              height: 480,
              width: 400,
              child: ListView.builder(
                itemCount: Provider.of<ECProvider>(context , listen: false).allCart.length,
                itemBuilder: (context, index) {
                  return CardCart(Provider.of<ECProvider>(context , listen: false).allCart[index]);
                  
                },),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20 ),
              height: 100,
              decoration: BoxDecoration(
                color: style.Colors.mainColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                  bottomRight: Radius.circular(35),

                )
              ),
              child: Row(
                children: <Widget>[

                  Expanded(
                    
                     child: Container(
                      width: 250,
                      margin: EdgeInsets.only(right: 20),
                      
                
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Total Price:' , style: TextStyle(
                            color: style.Colors.titleColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),),
                          Text("$myTotal \$" , style: TextStyle(
                            color: style.Colors.secondColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Tax & Fees :' , style: TextStyle(
                            color: style.Colors.titleColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),),
                          Text("0.0 \$" , style: TextStyle(
                            color: style.Colors.secondColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Delivery :' , style: TextStyle(
                            color: style.Colors.titleColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),),
                          Text("Free" , style: TextStyle(
                            color: style.Colors.secondColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ],
                ),
              ),
                  ),
              Expanded(
                flex: 0,
                child: Container(
                  margin: EdgeInsets.only(right: 6),
                height: 80,
                width: 90,
                decoration: BoxDecoration(
                  color: style.Colors.secondColor,
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: style.Colors.titleColor,
                      blurRadius: 5,
                    )
                  ]
                ),
                child: IconButton(icon: Icon(Icons.arrow_forward , size: 50, color: style.Colors.titleColor,),
                 
                 
                 onPressed: ()async{
                   DateTime date = DateTime.now();
                   myProviderAdmin.currentUserId();
                   myProvider.getStoreById(myProviderAdmin.currentUser.uid);
                   myProvider.getAllCart();
                   print("lkjhgfcxc ${ myProvider.allCart.map((e) => e.toJson()).toList().first}");
                   await myProvider.insertNewOrder(
                     Order(
                       
                        myProvider.allCart2
                        ,
                         myProviderAdmin.currentUser.uid,
                          myProvider.profileStore.address,
                           '$date',
                            "$myTotal",
                             false,
                             5
                             )
                   );
                   print("jhgfdsdfghjk");
                    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.green,
      ),
    );
      Alert(
      context: context,
      style: alertStyle,
      type: AlertType.success,
      title: "Successfull",
      desc: "the add process is Done ",
      buttons: [
        DialogButton(
          child: Text(
            "Done!",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
           
              Navigator.pop(context);

           

          } ,
          color: Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
                   myProvider.deleteAllProductCart();

                 }),
              ))
                ],
              )
            )
          ],
        ),
      ),
       
    );
  }
}


   class MyClippe extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0,size.height-20 );
    path.quadraticBezierTo(size.width/4, size.height-40, size.width/2, size.height-10);
    path.quadraticBezierTo(size.width-(size.width/4), size.height+15, size.width, size.height-40);
    path.lineTo(size.width, 0.0);

     return path;
    }
  
    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}
