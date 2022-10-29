// To parse this JSON data, do
//
//     final alarmInfo = alarmInfoFromJson(jsonString);

import 'dart:convert';

AlarmInfo alarmInfoFromJson(String str) => AlarmInfo.fromMap(json.decode(str));

String alarmInfoToJson(AlarmInfo data) => json.encode(data.toMap());

class AlarmInfo {
    AlarmInfo({
        required this.id,
        required this.title,
        required this.alarmDateTime,
        required this.isPending,
        required this.gradientColorIndex,
    });

    int id;
    String title;
    String alarmDateTime;
    bool isPending;
    int gradientColorIndex;

    factory AlarmInfo.fromMap(Map<String, dynamic> json) {
      return AlarmInfo(
        id: json["id"],
        title: json["title"],
        alarmDateTime: json["AlarmDateTime"],
        isPending: json["isPending"],
        gradientColorIndex: json["GradientColorIndex"],
    );
    }
    Map<String, dynamic> toMap() {
    return{
        "id": id,
        "title": title,
        "AlarmDateTime": alarmDateTime,
        "isPending": isPending,
        "GradientColorIndex": gradientColorIndex,
    };
    }
}
