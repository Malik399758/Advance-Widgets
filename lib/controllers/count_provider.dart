
import 'package:flutter/cupertino.dart';

class ItemProvider extends ChangeNotifier{
  int count = 0;

  // count increment

  void countIncrement(){
    count++;
    notifyListeners();
  }

  // count decrement

  void countDecrement(){
    count--;
    notifyListeners();
  }

}