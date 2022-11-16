import 'dart:async';

import 'package:cardio_dog/app/heart_hate/presenter/components/heart_dialog.dart';
import 'package:cardio_dog/main.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'heart_beat_store.g.dart';

class HeartBeatStore = _HeartBeatStore with _$HeartBeatStore;

abstract class _HeartBeatStore with Store {
  @observable
  bool isInit = false;

  @observable
  int seconds = 0;

  @observable
  int secondsReverse = 30;

  @observable
  int secondsImage = 1;

  Timer? cronometer;

  @action
  void clickCounter() {
    if (isInit) seconds++;
  }

  @action
  void restart() {
    cancel();
    seconds = 0;
    secondsReverse = 30;
  }

  void cancel() {
    cronometer!.cancel();
  }

  @action
  void temporizator() {
    isInit = true;
    cronometer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsReverse == 0) {
        showDialog(
            context: navigatorKey.currentContext!,
            builder: (_) {
              return const HeartDialog();
            });
        timer.cancel();
        isInit = false;
      } else {
        secondsReverse--;
      }
    });
  }
}
