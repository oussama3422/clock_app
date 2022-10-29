// import 'package:clock_app/data.dart';
// import 'package:flutter/material.dart';

// class ClockPage extends StatefulWidget {
//   const ClockPage({super.key});


//   @override
//   State<ClockPage> createState() => _ClockPageState();
// }

// class _ClockPageState extends State<ClockPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//                   margin:const  EdgeInsets.all(8),
//                   padding:const EdgeInsets.all(8),
//                   width: 100,
//                   child:Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       ListView(
//                             children: clock.map((alarme){
//                               return Container(
//                                 height: 100,
//                                decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(13),
//                                 gradient:const LinearGradient(colors: [
//                                   Color.fromARGB(255, 28, 231, 183),
//                                   Colors.lightGreen,
//                                   ],
//                                   begin:Alignment.centerLeft,
//                                   end:Alignment.topCenter,
//                                   )
//                                ),
//                                child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                        const Icon(Icons.label,size: 30,color:Colors.grey),
//                                        Switch(value: true, onChanged: (val){})
//                                     ],
//                                   )
//                                 ],
//                                ),
//                               );
//                             }).toList(),
//                            ),
//                     ],
//                   )
//                 );
//                   // padding:const EdgeInsets.symmetric(horizontal: 32,vertical: 64),
//                   // child:  Column(
//                   //     children:[
//                   //          const Text('Alarm',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.purple),),
//                   //          ListView(
//                   //           children: clock.map((alarme){
//                   //             return Container(
//                   //               // color: Colors.red,
//                   //               height: 100,
//                   //              decoration: BoxDecoration(
//                   //               borderRadius: BorderRadius.circular(13),
//                   //               gradient:const LinearGradient(colors: [
//                   //                 Color.fromARGB(255, 28, 231, 183),
//                   //                 Colors.lightGreen,
//                   //                 ],
//                   //                 begin:Alignment.centerLeft,
//                   //                 end:Alignment.topCenter,
//                   //                 )
//                   //              ),
//                   //              child: Column(
//                   //               children: [
//                   //                 Row(
//                   //                   children: [
//                   //                      const Icon(Icons.label,size: 30,color:Colors.grey),
//                   //                      Switch(value: true, onChanged: (val){})
//                   //                   ],
//                   //                 )
//                   //               ],
//                   //              ),
//                   //             );
//                   //           }).toList(),
//                   //          )
//                   //     ]
//                   //   ),
                  
//   }
// }