import 'package:clock_app/constant/enum.dart';
import 'package:clock_app/controller/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'view/homepage.dart';

FlutterLocalNotificationsPlugin flutterlocalNotificationPlugin=FlutterLocalNotificationsPlugin();
void main() {
  WidgetsFlutterBinding.ensureInitialized();



  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<Info>(
        create:(context)=>Info(typeclock:Typeclock.alarme) ,
        child:  const MyHomePage(),
        ),
    );
  }
}
