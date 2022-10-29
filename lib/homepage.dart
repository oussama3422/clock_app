import 'dart:html';

import 'package:clock_app/clock_view.dart';
import 'package:clock_app/enum.dart';
import 'package:clock_app/info.dart';
import 'package:clock_app/view/alarm_page.dart';
import 'package:clock_app/view/clock_page.dart';
import 'package:clock_app/view/timeup_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'data.dart';


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
        title: const Text('Clock App',style: TextStyle(color:Colors.black45,fontWeight: FontWeight.bold,fontSize: 30),),centerTitle: true,
      ),
      body:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children:listinfo.map((currentMenuInfo) => alarmTouch(currentMenuInfo)).toList()
          ),
          const VerticalDivider(color: Colors.amberAccent,width: 2),
          Expanded(
            child: Consumer<Info>(
              builder:(context, value, child) {
                if (value.typeclock==Typeclock.clock){
                  return Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                  child:ListView(
                    children: [
                      Column(
                            children: clock.map((alarme){
                              return Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                padding: const EdgeInsets.all(10),
                               decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 54, 244, 168).withOpacity(0.4),
                                    blurRadius: 8,
                                    spreadRadius: 2,
                                    offset: const Offset(5, 5)

                                  )
                                 ],
                                gradient: LinearGradient(
                                  colors: alarme.gradientColor!,
                                  begin:Alignment.centerLeft,
                                  end:Alignment.topCenter,
                                  )
                               ),
                               child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        const Icon(Icons.label,color: Colors.grey,),
                                        const SizedBox(width: 10),
                                        Text(alarme.description!,style:const TextStyle(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.bold),)
                                      ],
                                      ),
                                      Switch(value: true, onChanged: (val){}),
                                    ],
                                   ),
                                  const Text('Monday',style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.bold),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:const [
                                       Text('21;08',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),),
                                       Icon(Icons.keyboard_arrow_down),
                                    ],
                                  ),
                                 ],
                               ),
                              );
                            }).followedBy(
                              [
                                 Container(
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    children:[
                                      Image.asset(''),
                                    ]
                                  ),
                                 )
                              ]
                            ).toList(),
                           ),
                    ],
                  )
                );
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
