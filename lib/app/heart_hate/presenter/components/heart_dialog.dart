import 'package:cardio_dog/app/heart_hate/presenter/components/heart_beat_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HeartDialog extends StatelessWidget {
  const HeartDialog({super.key});

  @override
  Widget build(BuildContext context) {

    final store = Provider.of<HeartBeatStore>(context);
    
    return Observer(
      builder: (_) {
       return AlertDialog(
              title: const Text('Monitor cardíaco'),
              content: Text('A frequência cardíaca do seu animal é ${store.seconds * 2}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Fechar'),
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              ],
            );
      },
    );
  }
}
