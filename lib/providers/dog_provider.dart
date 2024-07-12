import 'package:flutter/material.dart';
import '../models/dog_breed.dart';
import '../services/api_service.dart';

class DogProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<DogBreed> _dogBreedList = [];
  String? _randomImage;
  bool _isLoading = false;

  List<DogBreed> get dogBreedList => _dogBreedList;
  String? get randomImage => _randomImage;
  bool get isLoading => _isLoading;

  Future<void> fetchDogData() async {
    _isLoading = true;
    notifyListeners();

    _dogBreedList = await _apiService.fetchDogBreeds();
    _randomImage = await _apiService.fetchRandomImage();
    _isLoading = false;
    notifyListeners();
  }
}
