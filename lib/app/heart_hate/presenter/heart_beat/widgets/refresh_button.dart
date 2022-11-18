import 'package:cardio_dog/app/heart_hate/presenter/heart_beat/stores/heart_beat_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<HeartBeatStore>(context);

    return Observer(builder: (_) {
      return Lottie.asset(
        'lib/app/heart_hate/presenter/assets/images/refresh2.json',
        animate: store.isLoading ? true : false,
        //repeat: store.isLoading ? true : false,
      );
    });
  }
}
