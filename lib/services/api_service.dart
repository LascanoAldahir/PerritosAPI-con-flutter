import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/dog_breed.dart';

class ApiService {
  static const String _baseUrl = 'https://dog.ceo/api/breeds/list/all';
  static const String _randomImageUrl =
      'https://dog.ceo/api/breeds/image/random';

  Future<List<DogBreed>> fetchDogBreeds() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body)['message'];
      List<DogBreed> breeds = [];
      json.forEach((key, value) {
        breeds.add(DogBreed(breed: key, subBreeds: List<String>.from(value)));
      });
      return breeds;
    } else {
      throw Exception('Failed to load dog breeds');
    }
  }

  Future<String> fetchRandomImage() async {
    final response = await http.get(Uri.parse(_randomImageUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      throw Exception('Failed to load random image');
    }
  }
}
