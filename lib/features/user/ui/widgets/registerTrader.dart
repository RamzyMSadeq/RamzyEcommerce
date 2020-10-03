
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;



class RegisterTrader extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 150,),
            Text("To register for the App",style: TextStyle(
              color: style.Colors.mainColor,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
            Text("Contact me",style: TextStyle(
              color: style.Colors.mainColor,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50 , vertical: 50),
              child: Column(
                children: [
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/whats.png"),
                      )
                    ),
                    
                  ),
                  //Image.asset("assets/images/whats.png" , fit: BoxFit.fill,),
                  Text("+972597765854               ",style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600
                  ),),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/fb.png"),
                      )
                    ),
                    
                  ),
                  //Image.asset("assets/images/whats.png" , fit: BoxFit.fill,),
                  Text("/RamzyMohammed         ",style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600
                  ),),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/gmail.png"),
                      )
                    ),
                    
                  ),
                  //Image.asset("assets/images/whats.png" , fit: BoxFit.fill,),
                  Text("ramzysadeq@gmail.com",style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600
                  ),),
                ],
              ),
                ],
              )
            )
          ],
        ),
      ),
    );
    
    //  Container(
    //   margin: EdgeInsets.only(top: 100),
    //   padding: EdgeInsets.all(20),

    //   child: Form(
    //     key: globalKey2,
    //     child: Column(
    //     children: <Widget>[
    //       TextFiledLogInReg(
    //         hintName:'The Store Name' ,
    //          iconName: Icon(Icons.person_outline , size: 25,),
    //          validationFun: validateStoreName,
    //         saveFormField: saveStoreName,
             
    //          ),
    //               SizedBox(height: 10,),
    //       TextFiledLogInReg(
    //         hintName:'The Email' ,
    //          iconName: Icon(Icons.alternate_email , size: 25,),
    //          validationFun: validateStoreEmail,
    //         saveFormField: saveStoreEmail,
    //          ),
    //               SizedBox(height: 10,),
            
    //       TextFiledLogInReg(
    //         hintName:'The Password' ,
    //          iconName: Icon(Icons.lock_outline , size: 25,),
    //          validationFun: validateStorePassword,
    //         saveFormField: saveStorePassword,
    //          ),
    //               SizedBox(height: 10,),
    //       TextFiledLogInReg(
    //         hintName:'The Store Type' ,
    //          iconName: Icon(Icons.lock_outline , size: 25,),
    //          validationFun: validateStoreType,
    //         saveFormField: saveStoreType,
    //          ),
    //               SizedBox(height: 15,),
    //               Container(
    //                // margin: EdgeInsets.symmetric(horizontal: 30),
    //                 width: 400,
    //                 height: 55,
                    
    //                 decoration: BoxDecoration(
    //                   color: style.Colors.mainColor,
    //                   borderRadius:BorderRadius.only(
    //                           topLeft: Radius.circular(30),
    //                           bottomLeft: Radius.circular(30),
    //                           bottomRight: Radius.circular(40),
    //                         ) ,
    //                   boxShadow: <BoxShadow>[
    //                     BoxShadow(
    //                       blurRadius: 8,
    //                       color: Colors.grey[500],
    //                       offset: Offset(1, 3)
    //                     )
    //                   ]

    //                 ),
    //                 child: FlatButton(onPressed: () async{
    //                   if(submitForm()){
    //                     ecProvider.setIndicator(true);
    //                     String idUser = await AuthService.auth.registerWithEmail(storeEmail, storePassword);
    //                     HandlSt.handlSt.setShared(idUser, true , 'Admin');
    //                     Provider.of<ECProvider>(context , listen: false).setUserEmail(storeEmail);
    //                   Provider.of<ECProvider>(context , listen: false).setUserPassword(storePassword);
    //                   Provider.of<ECProvider>(context , listen: false).setIsAdmin(true);
    //                   Provider.of<ECProvider>(context , listen: false).setUserIdTest(idUser);
    //                   Provider.of<ECProvider>(context , listen: false).setUserName(storeName);
    //                   Provider.of<ECProvider>(context , listen: false).setImgProfile('https://cdn.hipwallpaper.com/i/29/35/VzvAlh.jpg');
    //                   Provider.of<ECProvider>(context , listen: false).setImgCover('https://cdn.hipwallpaper.com/i/29/35/VzvAlh.jpg');
    //                   //print( Provider.of<ECProvider>(context , listen: false).isAdmin);
    //                  // Provider.of<ECProvider>(context , listen: false).addNewUserToFirbase();
    //                   print('DDDDDDDDDDDDDDDDDDDDd');
    //                     ecProvider.setIndicator(false);
    //                     Navigator.of(context).pushReplacement(MaterialPageRoute(
    //                         builder: (context)=>CurrentMap(
    //                           idUser,
    //                           storeEmail,
    //                           storePassword,
    //                           storeName
    //                         )));
                          
    //                   // print(user.email);
    //                   }
    //                 },
    //                 //color: style.Colors.mainColor,
    //                // padding: EdgeInsets.symmetric(horizontal: 160, vertical: 23),
                   

    //                  child: Text('Sign Up', style: TextStyle(
    //                    fontSize: 18,
    //                    fontWeight: FontWeight.bold,
    //                    color: style.Colors.titleColor
                      
    //                  ),),
                     
    //                  ),
    //               ),
    //               SizedBox(height: 5,),
    //               Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: <Widget>[
    //               Text('have a account? ',
    //                   style: GoogleFonts.poppins(
    //                       color: style.Colors.hintColor,
    //                       fontSize: 12,
    //                       fontWeight: FontWeight.bold)),
    //               GestureDetector(
    //                 onTap: () {
    //                   Navigator.of(context).push(MaterialPageRoute(
    //                       builder: (contex) => LogInScreens()));
    //                 },
    //                 child: Text(' Log In',
    //                     style: GoogleFonts.poppins(
    //                         color: style.Colors.mainColor,
    //                         fontSize: 12,
    //                         fontWeight: FontWeight.bold)),
    //               ),
    //             ],
    //           ),
    //           SizedBox(height: 10,),
    //            ecProvider.indecator == true 
    //         ?
    //         CircularProgressIndicator(backgroundColor: Colors.red,)
    //         :
    //         Container()


    //     ],
    //   ),
    //     )
      
    // );
  }
}