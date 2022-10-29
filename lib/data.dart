import 'package:clock_app/constant/theme_data.dart';
import 'package:clock_app/enum.dart';
import 'package:clock_app/view/clock_info.dart';
import 'package:flutter/widgets.dart';
import 'info.dart';

List<Info> listinfo=[
Info(typeclock:Typeclock.clock,imageSrc:'assets/clock.png',title: 'Clock'),
Info(typeclock:Typeclock.alarme,imageSrc: 'assets/alarm-clock.png',title:'Alarme'),
Info(typeclock:Typeclock.timeUp,imageSrc: 'assets/hourglass.png',title:'TimesUp')
];
List<ClockInfo> clock=[
  ClockInfo(DateTime.now().add(const Duration(hours: 1)),description: 'Office',gradientColor: GradientColor.sky),
  ClockInfo(DateTime.now().add(const Duration(hours: 1)),description: 'Remote',gradientColor: GradientColor.sunset),
  ClockInfo(DateTime.now().add(const Duration(hours: 1)),description: 'Hybird',gradientColor: GradientColor.sea),
  ClockInfo(DateTime.now().add(const Duration(hours: 1)),description: 'Office',gradientColor: GradientColor.sky),
  ClockInfo(DateTime.now().add(const Duration(hours: 1)),description: 'Remote',gradientColor: GradientColor.sunset),
  ClockInfo(DateTime.now().add(const Duration(hours: 1)),description: 'Hybird',gradientColor: GradientColor.sea),
];