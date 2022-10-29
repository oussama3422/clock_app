import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TimeUppage extends StatefulWidget {
  const TimeUppage({super.key});

  @override
  State<TimeUppage> createState() => _TimeUppageState();
}

class _TimeUppageState extends State<TimeUppage> {
  @override
  Widget build(BuildContext context) {
    return Container(
                  margin:const  EdgeInsets.all(8),
                  padding:const EdgeInsets.all(8),
                  child: RichText(
                    text: const TextSpan(
                      style:  TextStyle(fontSize: 20),
                      children:<TextSpan>[
                         TextSpan(text:'TimeUp Page',style:const TextStyle(fontSize: 40))
                      ]
                    ),
                    ),
                );
  }
}