import 'dart:async';
import 'package:get/get.dart';

class CountDownTimerState extends GetxController {
  var seconds = 59;
  var min = 59;

  late Timer _timer;

  void StateTimerStart() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (min > 0) {
        if (seconds > 0) {
          seconds--;
          update();
        } else {
          min--;
          seconds = 60;
        }
      } else {
        seconds = 0;
        min = 0;
      }
    });
  }

  void setnumber(var num) {
    seconds = int.parse(num);
    min = int.parse(num);
    update();
  }
}
