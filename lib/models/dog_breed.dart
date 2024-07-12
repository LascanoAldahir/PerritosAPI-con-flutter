class DogBreed {
  final String breed;
  final List<String> subBreeds;

  DogBreed({required this.breed, required this.subBreeds});

  factory DogBreed.fromJson(Map<String, dynamic> json) {
    return DogBreed(
      breed: json['breed'],
      subBreeds: List<String>.from(json['subBreeds']),
    );
  }
}
