import 'package:cardio_dog/app/heart_hate/domain/entity/dog_entity.dart';
import 'package:cardio_dog/app/heart_hate/domain/error/dog_errors.dart';
import 'package:cardio_dog/app/heart_hate/domain/repository/dog_repository.dart';
import 'package:cardio_dog/app/heart_hate/domain/usecase/create_dog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DogRepositoryMock extends Mock implements IDogRepository {}

void main() {
  final dogRepository = DogRepositoryMock();

  setUp(() {
    registerFallbackValue(const DogEntity(
      name: 'Malu',
      image: 'image malu',
      heartHate: 15,
    ));
  });

  group('Create dog', () {
    test('Creating a dog', () async {
      // arrange
      final createDog = CreateDog(dogRepository);
      when(() => dogRepository.createDog(any()))
          .thenAnswer((invocation) async => true);

      // act
      var result = await createDog(const DogEntity(
        name: 'Malu',
        image: 'image malu',
        heartHate: 15,
      ));

      //asset
      expect(result, isTrue);
      verify(
        () => dogRepository.createDog(
          const DogEntity(
            name: 'Malu',
            image: 'image malu',
            heartHate: 15,
          ),
        ),
      ).called(1);

      verifyNoMoreInteractions(dogRepository);
    });

    test('Creating a dog with a Id setted', () async {
      // arrange
      final createDog = CreateDog(dogRepository);
      when(() => dogRepository.createDog(any())).thenThrow(InvalidDog());

      // act
      var result = createDog.call(const DogEntity(
        id: '1',
        name: 'Malu',
        image: 'image malu',
        heartHate: 15,
      ));

      //assert
      expectLater(result, throwsA(isA<InvalidDog>()));
    });

    test('Creating a dog with a empty name', () async {
      // arrange
      final createDog = CreateDog(dogRepository);
      when(() => dogRepository.createDog(any())).thenThrow(InvalidDog());

      // act
      var result = createDog(const DogEntity(
        id: '1',
        name: '',
        image: 'image malu',
        heartHate: 15,
      ));

      //assert
      expectLater(result, throwsA(isA<InvalidDog>()));
    });
  });
}
