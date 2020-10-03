import 'package:e_commerce_project/features/admin/providers/admin_provider.dart';
import 'package:e_commerce_project/features/user/Provider/e_c_provider.dart';
import 'package:e_commerce_project/features/user/Repositories/handler.dart';
import 'package:e_commerce_project/features/user/ui/Screens/splash_Screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  bool isLogin= await HandlSt.handlSt.getSharedName();
  String role = await HandlSt.handlSt.getRole();
 
  runApp(MyApp(isLogin , role));
}

class MyApp extends StatelessWidget {
  
   bool isLogin ;
   String role;
   
   
  MyApp(this.isLogin ,this.role);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { 
    
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<ECProvider>( create: (context) => ECProvider(),),
        ChangeNotifierProvider<AdminProvider>(create: (context)=>AdminProvider())
      ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
          
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Builder(builder: (context){
            
              //Size size = MediaQuery.of(context).size ;
              ScreenUtil.init(context , width: 411, height: 866); 
              return  SplashScreen();
          }),
        
           
             
      ),
    );
  }
}

