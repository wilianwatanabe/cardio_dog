import 'package:cardio_dog/app/heart_hate/presenter/heart_beat/stores/heart_beat_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HeartWidget extends StatelessWidget {
  const HeartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<HeartBeatStore>(context);
    return Observer(builder: (_) {
      return Lottie.asset(
        // 'lib/app/heart_hate/presenter/assets/images/heart${store.secondsImage}.png',
        'lib/app/heart_hate/presenter/assets/images/heart.json',
        animate: store.isInit ? true : false,
        repeat: store.isInit ? true : false,
      );
    });
  }
}
