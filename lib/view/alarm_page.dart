import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../clock_view.dart';
class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    var now=DateTime.now();
    var formatedTime=DateFormat('HH:mm').format(now);
    var formatedDate=DateFormat('EEE,d MMM').format(now);
    var timezoneString=now.timeZoneOffset.toString().split('.').first;

    var timezoneSign='';
   if(!timezoneString.startsWith('-')){
    timezoneSign='+';
   }
    return Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: Column(
                children:  [
                  const SizedBox(height: 40),
                   Text(
                   formatedTime,
                     style: const TextStyle(color:Color.fromARGB(255, 34, 33, 33),fontSize:66),
                    ),
                   Text(
                    formatedDate,
                     style:const TextStyle(color:Color.fromARGB(255, 34, 33, 33),fontSize: 20),
                    ),
                  const SizedBox(height: 40),
                  const SizedBox(height: 90),
                  const ClockView(),
                  const SizedBox(height: 120),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.language),
                      Text(
                      'UTC$timezoneSign$timezoneString',
                      style: TextStyle(color:Colors.grey[800],fontSize: 30),
                    ),
                    ],
                  ),
                ],
              ),
           );
  }
}