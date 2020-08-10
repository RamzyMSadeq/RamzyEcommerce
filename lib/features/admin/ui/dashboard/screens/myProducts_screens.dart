import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/features/admin/providers/admin_provider.dart';
import 'package:e_commerce_project/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyProductsScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Products"),
      ),

      body: Consumer<AdminProvider>(
        builder: (context, value, child) {
          value.currentUserId();
          String idid= value.currentUser.uid;
          value.getMyProduct(idid);
          List<ProductModel> myProducts = value.myProductsToAdmin;
         
          return
           myProducts !=null 
          ? Container(
          margin: EdgeInsets.all(20),
          
          child: ListView.builder(
            itemCount: myProducts.length,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                child: Card(
                  child:Center(
                    child: ListTile(
                      title: Text(myProducts[index].title),
                      leading: 
                      myProducts[index].imageUrl == null 
                      ?
                      CircleAvatar(
                         maxRadius: 30,
                       backgroundColor: Colors.green,

                      )
                      :
                      CircleAvatar(
                        maxRadius: 30,
                        backgroundImage: CachedNetworkImageProvider(myProducts[index].imageUrl),

                      ),
                      trailing: IconButton(icon: Icon(Icons.delete_forever),
                       onPressed:()async{
                         await value.deleteProduct(myProducts[index].documentId);
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
      desc: "the delete process is Done ",
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

                      }),
                    ),
                  ) ,),

              );
            },

            
          ),
        )
        :
        Center(child: CircularProgressIndicator());
          
          
        },
           
      ),
      
    );
  }
}