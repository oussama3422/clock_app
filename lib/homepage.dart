import 'package:clock_app/alarm_helper.dart';
import 'package:clock_app/enum.dart';
import 'package:clock_app/info.dart';
import 'package:clock_app/model/alarm_info.dart';
import 'package:clock_app/view/alarm_page.dart';
import 'package:clock_app/view/timeup_page.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:interval_time_picker/interval_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'data.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? alarmeTime;
  String? alarmTimeString;
  AlarmHelper alarmhelper=AlarmHelper();
  @override
  void initState() {
      alarmeTime=DateTime.now();
      alarmhelper.initializeDatabase().then(((value) {
        print('----------------------Intialisation------------------Successfully-------------------');
      }));
      super.initState();
  }

    var repeat=[1,2,3,4];
    var sound='muslim';
    var title='Alrame 1';        

  @override
  Widget build(BuildContext context) {
      var now=DateTime.now().subtract(const Duration(hours: 1));
      var formatedTime=DateFormat('HH:mm').format(now); 
      var dateselcted=formatedTime; 
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
                  return Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                  child:ListView(
                    children: [
                      Column(
                            children: clock.map<Widget>((alarme){
                              var formatedTime=DateFormat('HH:mm').format(alarme.clockDateTime!);                              
                              return Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                padding: const EdgeInsets.all(10),
                               decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(255, 54, 244, 168).withOpacity(0.4),
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
                                    children: [
                                       Text(formatedTime,style:const TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),),
                                       const Icon(Icons.keyboard_arrow_down),
                                    ],
                                  ),
                                 ],
                               ),
                              );
                            }).followedBy(
                              [
                                 DottedBorder(
                                  color: Colors.blueGrey,
                                  radius: const Radius.circular(12),
                                  borderType: BorderType.RRect,
                                    child: Container(
                                    width: double.infinity,
                                    // margin: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextButton(
                                      onPressed: ()=>showMaterialModalBottomSheet(
                                        context: context,
                                        builder: (context) =>Container(
                                          height: 300,
                                          decoration:const BoxDecoration(
                                            color: Color.fromARGB(255, 57, 59, 57),
                                            boxShadow: [
                                              BoxShadow(blurRadius: 8,offset: Offset(4,4),spreadRadius: 1.0)
                                            ]
                                          ),
                                          child: Column(
                                            children: [
                                            const SizedBox(height: 10),
                                              TextButton(
                                              onPressed: () async{
                                             var selectedTime=await showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now(),
                                             );
                                             if(selectedTime==null){
                                              final now=DateTime.now();
                                              var selectedDateTime=DateTime(now.year,now.month,now.day,selectedTime!.hour,selectedTime.minute);
                                              alarmeTime=selectedDateTime;
                                              setState(() {
                                                alarmTimeString=selectedTime.toString();
                                              });
                                             }
                                             },
                                          child: Text(
                                                dateselcted,
                                                style: const TextStyle(color: Colors.blue,fontSize: 40,fontWeight: FontWeight.w900),
                                              )),
                                              ListTile(
                                                leading:const Text(
                                                  'Repeat',
                                                  style: TextStyle(
                                                    color:Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                  ),
                                                trailing: FloatingActionButton.extended(
                                                  label:const Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.white,size: 40),
                                                  onPressed: (){
                                                    showMaterialModalBottomSheet(context: context, builder: (context)
                                                            =>
                                                             Column(
                                                                children: [
                                                                  Padding(
                                                                    padding:  const EdgeInsets.all(30.0),
                                                                    child:  TextFormField(
                                                                      decoration: InputDecoration(
                                                                        border:OutlineInputBorder(borderRadius:  BorderRadius.circular(10)),
                                                                        enabledBorder:OutlineInputBorder(borderRadius:  BorderRadius.circular(10),borderSide:const BorderSide(color: Colors.grey,width:2,)),
                                                                        label: const Text('Enter Name'),
                                                                        icon: const Icon(Icons.label_important)
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ElevatedButton(
                                                                  onPressed: (){
                                                                    Navigator.of(context).pop();
                                                                  },
                                                                  child: const Text('Save'))
                                                                ],
                                                              ) 
                                                            );
                                                  },
                                                ),
                                              ),
                                             const Divider(
                                                color: Colors.purple,
                                                thickness: 3.0,
                                              ),
                                               ListTile(
                                                leading: const Text(
                                                  'Sound',
                                                  style: TextStyle(
                                                    color:Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                  ),
                                                trailing: IconButton(
                                                  icon:const Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.white,size: 40),
                                                  onPressed: (){
                                                            showMaterialModalBottomSheet(context: context, builder: (context)
                                                            =>
                                                             Column(
                                                                children: [
                                                                  const Padding(
                                                                    padding:  EdgeInsets.all(30.0),
                                                                    child:  TextField(
                                                                      decoration: InputDecoration(
                                                                        label: Text('Enter Name'),
                                                                        icon: Icon(Icons.label_important)
                                                                      ),
                                                                    ),
                                                                  ),
                                                                TextButton(
                                                                  onPressed: (){

                                                                    Navigator.of(context).pop();
                                                                  },
                                                                  child: const Text('Save'))
                                                                ],
                                                              ) 
                                                            );
                                                  }, 
                                                  ),
                                              ),
                                              const Divider(
                                                color: Colors.purple,
                                                thickness: 3.0,
                                              ),
                                              ListTile(
                                                leading: const Text(
                                                  'Title',
                                                  style: TextStyle(
                                                    color:Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                  ),
                                                trailing: IconButton(
                                                  icon:const Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.white,size: 40),
                                                  onPressed: (){
                                                    showMaterialModalBottomSheet(context: context, builder: (context)
                                                            =>
                                                             Column(
                                                                children: [
                                                                  const Padding(
                                                                    padding:  EdgeInsets.all(30.0),
                                                                    child:  TextField(
                                                                      decoration: InputDecoration(
                                                                        label: Text('Enter Name'),
                                                                        icon: Icon(Icons.label_important)
                                                                      ),
                                                                    ),
                                                                  ),
                                                                TextButton(
                                                                  onPressed: (){
                                                                    
                                                                    Navigator.of(context).pop();
                                                                  },
                                                                  child: const Text('Save'))
                                                                ],
                                                              ) 
                                                            );
                                                  },
                                                  ),
                                              ),
                                              FloatingActionButton.extended(
                                                onPressed: (){
                                                  DateTime scheduleAlramDateTime;
                                                  if(alarmeTime!.isAfter(DateTime.now())){
                                                    scheduleAlramDateTime=alarmeTime!;
                                                  }
                                                  scheduleAlramDateTime=alarmeTime!.add(const Duration(days: 1));
                                                  var alarmInfo=AlarmInfo(
                                                    id: 1,
                                                    title: title,
                                                    alarmDateTime: scheduleAlramDateTime.toString(),
                                                    isPending: true,
                                                    gradientColorIndex: clock.length
                                                    );
                                                },
                                                label: Row(
                                                  children:const [
                                                    Icon(Icons.alarm),
                                                    Text('Save')
                                                  ],
                                                ),
                                                )
                                            ],
                                          ),
                                        ) 
                                        ),
                                      child: Column(
                                        children:[
                                          const SizedBox(height: 10),
                                          Image.asset('assets/add_clock.png',scale: 4,height: 60,),
                                          const Text(
                                            'add alaram',
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 53, 48, 54),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            )
                                        ]
                                      ),
                                    ),
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
