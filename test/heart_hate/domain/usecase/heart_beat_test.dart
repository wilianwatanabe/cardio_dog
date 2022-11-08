import 'package:cardio_dog/app/heart_hate/domain/usecase/heart_beat.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should increment once time', () async {
    //arrange
    final heartDog = HeartBeat();

    //act
    var result = await heartDog.increment(1);

    //assert
    expect(result, 1);
  });
}
