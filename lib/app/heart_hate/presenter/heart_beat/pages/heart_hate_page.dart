import 'dart:async';

import 'package:cardio_dog/app/heart_hate/presenter/heart_beat/stores/heart_beat_store.dart';
import 'package:cardio_dog/app/heart_hate/presenter/heart_beat/widgets/heart_widget.dart';
import 'package:cardio_dog/app/heart_hate/presenter/heart_beat/widgets/refresh_button.dart';
import 'package:cardio_dog/app/heart_hate/presenter/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HeartBeatPage extends StatefulWidget {
  const HeartBeatPage({super.key});

  @override
  State<HeartBeatPage> createState() => _HeartBeatPageState();
}

class _HeartBeatPageState extends State<HeartBeatPage> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<HeartBeatStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CardioDog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: CustomColors.customSwatchColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
              ),
              width: double.infinity,
              height: 150,
              alignment: Alignment.center,
              child: const Text(
                textAlign: TextAlign.center,
                'Toque no coração a cada respiração completa enquanto o temporarizador estiver contando',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 0.5,
                      offset: Offset(0.5, 0.7),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text('Toque no coração para começar a contagem'),
            ),
            Observer(
              builder: (context) => SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(40),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        if (store.secondsReverse == 30) {
                          store.temporizator();
                        }

                        if (store.secondsReverse != 0) {
                          store.clickCounter();
                        }
                      },
                      child: Ink(
                        height: 300,
                        width: 300,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: const HeartWidget(),
                      ),
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
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      'Contador: ${store.seconds}',
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Observer(
        builder: (_) {
          return FloatingActionButton(
            onPressed: () {
              Timer.periodic(const Duration(milliseconds: 2020), (timer) {
                store.isLoading = false;
                timer.cancel();
              });

              store.isInit = false;
              
              store.restart();
            },
            elevation: 2.1,
            child: const RefreshButton(),
          );
        },
      ),
    );
  }
}
