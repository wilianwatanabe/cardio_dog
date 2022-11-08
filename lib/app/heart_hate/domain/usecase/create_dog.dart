import 'package:cardio_dog/app/heart_hate/domain/entity/dog_entity.dart';
import 'package:cardio_dog/app/heart_hate/domain/error/dog_errors.dart';
import 'package:cardio_dog/app/heart_hate/domain/repository/dog_repository.dart';

class CreateDog {
  final IDogRepository _repository;

  CreateDog(this._repository);

  Future<bool> call(DogEntity dog) async {
    if (dog.id != null) {
      throw InvalidDog();
    }

    if (!dog.isValid()) {
      throw InvalidDog();
    }

    return _repository.createDog(dog);
  }
}
