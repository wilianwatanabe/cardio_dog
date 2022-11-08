import 'package:cardio_dog/app/heart_hate/presenter/components/heart_beat_store.dart';
import 'package:cardio_dog/app/heart_hate/presenter/heart_hate_page.dart';
import 'package:cardio_dog/app/heart_hate/presenter/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => HeartBeatStore(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CardioDog',
        theme: ThemeData(
          primarySwatch: CustomColors.customSwatchColor,
        ),
        home: const HeartHate(),
      ),
    );
  }
}
