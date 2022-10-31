import 'package:clock_app/info.dart';
import 'package:clock_app/model/alarm_info.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';



final String tableName='table';
final String columnId='id';
final String columnTitle='title';
final String columnDateTime='dateTime';
final String columnPending='Pending';
final String columnColorIndex='GradientColorIndex';



class AlarmHelper{
  static Database? database;
  static AlarmHelper? alarmhelper;
  AlarmHelper._createInstance();
  factory AlarmHelper(){
     alarmhelper  ??=AlarmHelper._createInstance();
     return alarmhelper!;
  }

  Future<Database> get connectdatabase async{
    // CHECK IF THE DATABASE IS EMPTY OR NULL
    database ??= await initializeDatabase();
    return database!;
    
  }
  Future<Database> initializeDatabase()async{
   var directory=await getDatabasesPath();
   var path= "${directory}alarm.db";
   var database=openDatabase(
    path,
    version:1,
    onCreate: (db, version) {
        db.execute('''
           CREATE TABLE $tableName(
            $columnId integer primary key autoincrement,
            $columnTitle text not null,
            $columnDateTime text not null,
            $columnPending interger,
            $columnColorIndex integer
           )
      ''');
    }
   );
   return database;
  }

  insertAlarm(AlarmInfo alarmInfo)async{
    var db= await connectdatabase;
    var result=db.insert(tableName, alarmInfo.toMap());
    print(result);
  }
}