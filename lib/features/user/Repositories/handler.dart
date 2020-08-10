import 'package:shared_preferences/shared_preferences.dart';

class HandlSt{
  String userId;
  bool isLog = false;
  String role = '';

  HandlSt._();
  static HandlSt handlSt = HandlSt._();
  static SharedPreferences sharedPreferences;
  
  iniShared() async{
    if(sharedPreferences == null){
      sharedPreferences = await SharedPreferences.getInstance();
       return sharedPreferences;
    }else{
      return sharedPreferences;
      
    }  
  }

  setShared(String userId , bool isLogin , String role)async{
    sharedPreferences = await iniShared();
    sharedPreferences.setString('userId', userId);
    sharedPreferences.setBool('isLogIn', isLogin);
    sharedPreferences.setString('role', role);
    
  }

  getSharedName() async{
    sharedPreferences = await iniShared();
    sharedPreferences.getString('userId');
    bool isLogIn =  sharedPreferences.getBool('isLogIn');
    

    
    return isLogIn;
}
getRole() async{
    sharedPreferences = await iniShared();
    
   String role =  sharedPreferences.getString('role');
    

    
    return role;
}

}