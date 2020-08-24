import 'package:flutter/cupertino.dart';

class MainModel extends ChangeNotifier{
  String BananaText = 'banana';

  void changeBananaText(){
    BananaText = 'yeeeeeeeeee';
    notifyListeners();
  }
}