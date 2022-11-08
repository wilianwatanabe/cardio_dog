import 'dart:async';

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

  @action
  void clickCounter() {
    seconds++;
  }

  @action
  void initImage() {
    Timer.periodic(const Duration(seconds: 7), (timer) {
      if (secondsImage == 5) {
        timer.cancel();
      } else {
        secondsImage++;
      }
    });
  }

  @action
  void temporizator() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsReverse == 0) {
        timer.cancel();
      } else {
        secondsReverse--;
      }
    });
  }
}
