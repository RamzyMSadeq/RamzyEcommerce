import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DBProduct{
  DBProduct._();

  static final DBProduct dbProduct = DBProduct._();


  Database database;

  static final String tableName = 'cartTable';
  static final String idTable = 'id';
  static final String idUserColumn = 'iduser';
  static final String idTraderColumn = 'idtrader';
  static final String idProductColumn = 'idproduct';
  static final String imagUrlProductColumn = 'imageUrlFav';
  static final String titleProductColumn = 'titleproduct';
  static final String priceProductColum = 'priceproduct';
  



  Future<Database> initDB2() async {
    if(database != null){
      return database;
    }else{
      database = await connectToTowDB();
      return database;
    }

  }

  Future<Database> connectToTowDB() async {

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = join(appDocDir.path , 'cartProducts.db');
    Database db = await openDatabase(path , version: 1 , onCreate:(db,version){
          db.execute('''CREATE TABLE $tableName(
          $idTable  INTEGER PRIMARY KEY AUTOINCREMENT,
          $idUserColumn TEXT NOT NULL,
          $idTraderColumn TEXT NOT NULL,
          $idProductColumn TEXT NOT NULL,
          $imagUrlProductColumn TEXT NOT NULL,
          $titleProductColumn TEXT NOT NULL,
          $priceProductColum DOUBLE NOT NULL)''');
    });
    
    return db;
  }


   Future<int> insertDB(Map<String , dynamic> product)async{
    try{
      database = await initDB2();
      int res = await database.insert(tableName, product);
      return res;
      }catch(error){
      throw 'database error $error';
    }

  }


  Future<List<Map<String, dynamic>>> getProductDB()async{
    try{
      database = await initDB2();
    List<Map<String, dynamic>> listRes = await database.query(tableName );

    return listRes;
    }catch(error){
      throw 'database error $error';
    }

  }



  
  
  


  deleteproduct(int id) async {
    try {
     // print('delete4');
      database = await initDB2();
      int rows = await database.delete(tableName, where: '$idTable = ?', whereArgs: [id]);

          print('delete5');
      return rows;
    } catch (error) {
      print('delete6');
      throw 'database error $error';
      
    }
    
  }


  deleteAllProductCart() async {
    try {
      database = await initDB2();
      int rows = await database.delete(tableName);
      return rows;
    } catch (error) {
      throw 'database error $error';
    }
  }


}

