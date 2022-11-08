import 'package:cardio_dog/app/heart_hate/presenter/components/heart_beat_store.dart';
import 'package:cardio_dog/app/heart_hate/presenter/components/heart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HeartHate extends StatelessWidget {
  const HeartHate({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<HeartBeatStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CardioDog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Clique no coração para começar a contagem'),
            Observer(
              builder: (context) => SizedBox(
                child: Material(
                  child: InkWell(
                    onTap: () {
                      if (store.secondsReverse == 30) {
                        store.temporizator();
                        store.initImage();
                      }
                      store.clickCounter();
                    },
                    child: Ink(
                      height: 130,
                      width: 135,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: const HeartWidget(),
                    ),
                  ),
                ),
              ),
            ),
            Observer(
              builder: (_) {
                return Column(
                  children: [
                    Text(
                      'Temporizador: ${store.secondsReverse}',
                      style: const TextStyle(fontSize: 25),
                    ),
                    Text(
                      '${store.seconds} contagem',
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
