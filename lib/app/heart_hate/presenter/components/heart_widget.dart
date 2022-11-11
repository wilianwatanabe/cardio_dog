import 'package:cardio_dog/app/heart_hate/presenter/components/heart_beat_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HeartWidget extends StatefulWidget {
  const HeartWidget({super.key});

  @override
  State<HeartWidget> createState() => _HeartWidgetState();
}

class _HeartWidgetState extends State<HeartWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
  }

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
