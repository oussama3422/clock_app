
import 'dart:async';
import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ClockView extends StatefulWidget {
  const ClockView({super.key});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        
      });
     });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black38,
        alignment: Alignment.center,
        child: Transform.rotate(
          angle: -pi/2,
          child: CustomPaint(
            painter: ClockPainter(),
          ),
        ),
    );
  }
}

class ClockPainter extends CustomPainter{
  var datetime= DateTime.now();
  // var second=datetime.second;
  // var minutes=datetime.minute;
  // var hourse=datetime.hour;
  @override
  void paint(Canvas canvas, Size size) {   
   var centerX=size.width /2 ;
   var centerY=size.height /2 ;
   var center=Offset(centerX, centerY);
   var radius=min(centerX, centerY);
   
   var fillBrash=Paint()..color=const Color.fromARGB(255, 211, 153, 16);
   var outlineBrash=Paint()..color=const Color.fromARGB(255, 40, 255, 205)..strokeWidth=12;
   var inlineBrash=Paint()..color=const Color.fromARGB(255, 40, 65, 255);


   var secHandBrush=Paint()..shader=const RadialGradient(colors: [Colors.blueGrey,Colors.pink]).
   createShader(Rect.fromCircle(center: center, radius: radius))..strokeWidth=4..style=PaintingStyle.stroke..strokeCap=StrokeCap.round;
   

   var minHandBrush=Paint()..shader=const RadialGradient(colors: [Colors.blueGrey,Color.fromARGB(255, 68, 74, 66)]).
   createShader(Rect.fromCircle(center: center, radius: radius))..strokeWidth=4..style=PaintingStyle.stroke..strokeCap=StrokeCap.round;
   

   var hourBrush=Paint()..shader=const RadialGradient(colors: [Colors.blueGrey,Color.fromARGB(255, 7, 2, 170)]).
   createShader(Rect.fromCircle(center: center, radius: radius))..strokeWidth=4..style=PaintingStyle.stroke..strokeCap=StrokeCap.round;
   
   canvas.drawCircle(center, 100, fillBrash);
   canvas.drawCircle(center, 80, outlineBrash);
   canvas.drawCircle(center, 16, inlineBrash);
   //seconds brush
   var secHandX=centerX + 80 * cos(datetime.second * 6 * pi/180);
   var secHandY=centerX + 80 * sin(datetime.second * 6 * pi/180); 
   canvas.drawLine(center,  Offset(secHandX, secHandY), secHandBrush);
   // minutes brush
   var minHandX=centerX + 80 * cos(datetime.minute * 6 * pi/180);
   var minHandY=centerX + 80 * sin(datetime.minute * 6 * pi/180);
   canvas.drawLine(center,  Offset(minHandX, minHandY), minHandBrush);
   // hourse brush
    var hourHandX=centerX + 60 * cos((datetime.hour * 30 + datetime.minute * 0.5) * pi/180);
    var hourHandY=centerX + 60 * sin((datetime.hour * 30 + datetime.minute * 0.5) * pi/180);
   canvas.drawLine(center,Offset(hourHandX, hourHandY),hourBrush);

   var outerCircleRadius=radius;
   var innerCircleRadius=radius-14;
   for (double i=0;i<360;i+=12){
    var x1=centerX+outerCircleRadius * cos(i*pi/180);
    var y1=centerX+outerCircleRadius * sin(i*pi/180);

    var x2=centerX+innerCircleRadius * cos(i*pi/180);
    var y2=centerX+innerCircleRadius * sin(i*pi/180);

    var dashBrush=Paint()..color=Colors.lightBlueAccent..style=PaintingStyle.stroke..strokeCap=StrokeCap.round..strokeWidth=2;
    canvas.drawLine(Offset(x1,y1), Offset(x2,y2 ), dashBrush);
   }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

