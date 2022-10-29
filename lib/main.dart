import 'package:clock_app/enum.dart';
import 'package:clock_app/info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homepage.dart';

void main() {
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
