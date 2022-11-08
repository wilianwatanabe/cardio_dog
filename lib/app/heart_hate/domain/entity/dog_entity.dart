class DogEntity {
  final String? id;
  final String name;
  final String image;
  final int? heartHate;

  const DogEntity({
    this.id,
    required this.name,
    required this.image,
    this.heartHate,
  });

  bool isValid() {
    return name.isNotEmpty && image.isNotEmpty;
  }
}
