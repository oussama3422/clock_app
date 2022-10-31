import 'package:clock_app/constant/alarm_helper.dart';
import 'package:clock_app/constant/enum.dart';
import 'package:clock_app/controller/info.dart';
import 'package:clock_app/model/alarm_info.dart';
import 'package:clock_app/view/alarm_page.dart';
import 'package:clock_app/view/clock_page.dart';
import 'package:clock_app/view/timeup_page.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:interval_time_picker/interval_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../constant/data.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 63, 65),
        title: const Text('Clock App',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),centerTitle: true,
      ),
      body:Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:listinfo.map((currentMenuInfo) => alarmTouch(currentMenuInfo)).toList()
          ),
          const VerticalDivider(color: Colors.amberAccent,width: 2),
          Expanded(
            child: Consumer<Info>(
              builder:(context, value, child) {
                if (value.typeclock==Typeclock.clock){
                 return const ClockPage();
                }
                else if(value.typeclock==Typeclock.timeUp){
                  return  const TimeUppage();
                }
                else{
                  return  const AlarmPage();
                }
               
              },  
            ),
          ),
        ],
      ),
    );
  }

  Widget alarmTouch(Info currentInfo) {
    return Consumer<Info>(
      builder: (context, value, child) => 
      TextButton(
         style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              backgroundColor:MaterialStateProperty.all(
                 currentInfo.typeclock==value.typeclock?const Color.fromARGB(255, 161, 153, 153):Colors.transparent
            ),
            ),
                onPressed:(){
                  var info=Provider.of<Info>(context,listen: false);
                  info.updateMenuInfo(currentInfo);
                },
                child:Column(
                      children: [
                        const SizedBox(height: 40),
                      Image.asset(currentInfo.imageSrc?? '',width: 50,height: 50),
                        Text(currentInfo.title??'',style:TextStyle(color: Colors.grey[800],fontWeight: FontWeight.bold)),
                      ],
              ),
                  ),
    );
  }
}
