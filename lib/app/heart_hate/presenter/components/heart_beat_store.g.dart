// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heart_beat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HeartBeatStore on _HeartBeatStore, Store {
  late final _$isInitAtom =
      Atom(name: '_HeartBeatStore.isInit', context: context);

  @override
  bool get isInit {
    _$isInitAtom.reportRead();
    return super.isInit;
  }

  @override
  set isInit(bool value) {
    _$isInitAtom.reportWrite(value, super.isInit, () {
      super.isInit = value;
    });
  }

  late final _$secondsAtom =
      Atom(name: '_HeartBeatStore.seconds', context: context);

  @override
  int get seconds {
    _$secondsAtom.reportRead();
    return super.seconds;
  }

  @override
  set seconds(int value) {
    _$secondsAtom.reportWrite(value, super.seconds, () {
      super.seconds = value;
    });
  }

  late final _$secondsReverseAtom =
      Atom(name: '_HeartBeatStore.secondsReverse', context: context);

  @override
  int get secondsReverse {
    _$secondsReverseAtom.reportRead();
    return super.secondsReverse;
  }

  @override
  set secondsReverse(int value) {
    _$secondsReverseAtom.reportWrite(value, super.secondsReverse, () {
      super.secondsReverse = value;
    });
  }

  late final _$secondsImageAtom =
      Atom(name: '_HeartBeatStore.secondsImage', context: context);

  @override
  int get secondsImage {
    _$secondsImageAtom.reportRead();
    return super.secondsImage;
  }

  @override
  set secondsImage(int value) {
    _$secondsImageAtom.reportWrite(value, super.secondsImage, () {
      super.secondsImage = value;
    });
  }

  late final _$_HeartBeatStoreActionController =
      ActionController(name: '_HeartBeatStore', context: context);

  @override
  void clickCounter() {
    final _$actionInfo = _$_HeartBeatStoreActionController.startAction(
        name: '_HeartBeatStore.clickCounter');
    try {
      return super.clickCounter();
    } finally {
      _$_HeartBeatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initImage() {
    final _$actionInfo = _$_HeartBeatStoreActionController.startAction(
        name: '_HeartBeatStore.initImage');
    try {
      return super.initImage();
    } finally {
      _$_HeartBeatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void temporizator() {
    final _$actionInfo = _$_HeartBeatStoreActionController.startAction(
        name: '_HeartBeatStore.temporizator');
    try {
      return super.temporizator();
    } finally {
      _$_HeartBeatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isInit: ${isInit},
seconds: ${seconds},
secondsReverse: ${secondsReverse},
secondsImage: ${secondsImage}
    ''';
  }
}
