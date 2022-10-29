
import 'package:clock_app/enum.dart';
import 'package:flutter/foundation.dart';

class Info extends ChangeNotifier{
  Typeclock? typeclock;
  String? imageSrc;
  String? title;
  Info({this.typeclock,this.imageSrc, this.title});

  updateMenuInfo(Info menuInfo){
    typeclock=menuInfo.typeclock;
    title=menuInfo.title;
    imageSrc=menuInfo.imageSrc;
    notifyListeners();
  }
}