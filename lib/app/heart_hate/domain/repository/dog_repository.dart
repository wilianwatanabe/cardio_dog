import 'package:cardio_dog/app/heart_hate/domain/entity/dog_entity.dart';

abstract class IDogRepository {
  Future<bool> createDog(DogEntity dog);

  Future<DogEntity?> getDogById(String id);

  Future<bool> updateDog(DogEntity dog);

  Future<int> heartBeat(DogEntity dog);
}
