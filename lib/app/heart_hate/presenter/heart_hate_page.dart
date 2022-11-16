import 'package:cardio_dog/app/heart_hate/presenter/components/heart_beat_store.dart';
import 'package:cardio_dog/app/heart_hate/presenter/components/heart_widget.dart';
import 'package:cardio_dog/app/heart_hate/presenter/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HeartHatePage extends StatefulWidget {
  const HeartHatePage({super.key});

  @override
  State<HeartHatePage> createState() => _HeartHatePageState();
}

class _HeartHatePageState extends State<HeartHatePage> {
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
              child: Text('Clique no coração para começar a contagem'),
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
                        store.clickCounter();
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
              store.isInit = false;
              store.restart();
            },
            elevation: 2.1,
            child: const Icon(
              Icons.restart_alt_outlined,
            ),
          );
        },
      ),
    );
  }
}
