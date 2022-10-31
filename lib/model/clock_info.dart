import 'package:flutter/widgets.dart';

class ClockInfo{
  DateTime? clockDateTime;
  String? description;
  bool? isActive;
  List<Color>? gradientColor;

  ClockInfo(this.clockDateTime,{this.description,this.isActive,this.gradientColor});
}
