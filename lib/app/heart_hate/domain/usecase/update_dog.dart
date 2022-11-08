import 'package:cardio_dog/app/heart_hate/domain/entity/dog_entity.dart';
import 'package:cardio_dog/app/heart_hate/domain/error/dog_errors.dart';
import 'package:cardio_dog/app/heart_hate/domain/repository/dog_repository.dart';

class UpdateDog {
  final IDogRepository _repository;

  UpdateDog(this._repository);

  Future<bool> call(DogEntity dog) async {
    if (!dog.isValid()) {
      throw InvalidDog();
    }

    if (dog.id == null) {
      throw IdDogNotExists();
    }

    var dogId = await _repository.getDogById(dog.id!);

    if (dogId == null) throw DogNotFound();

    return _repository.updateDog(dog);
  }
}
