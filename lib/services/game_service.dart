import 'dart:math';
import 'package:flutter/material.dart';
import 'package:testing_1/models/quote.dart';

class GameService with ChangeNotifier {
  final Map<String, String> imageCategories = {
    'assets/food1.jpg': 'Food',
    'assets/food2.jpg': 'Food',
    'assets/food3.jpg': 'Food',
    'assets/scenery1.jpg': 'Scenery',
    'assets/scenery2.jpg': 'Scenery',
    'assets/scenery3.jpg': 'Scenery',
    'assets/people1.jpg': 'People',
    'assets/people2.jpg': 'People',
    'assets/people3.jpg': 'People',
  };

  late String currentImage;
  late String correctCategory;
  int correctCount = 0;
  int wrongCount = 0;
  List<String> previousImages = [];

  // Variabel untuk animasi
  bool isShaking = false;
  bool isScaling = false;
  String? selectedCategory;

  // Warna tombol berdasarkan kategori
  Color foodButtonColor = Colors.amber;
  Color sceneryButtonColor = Colors.amber;
  Color peopleButtonColor = Colors.amber;

  List<Quote> quotes = [
    Quote(author: 'Oscar Wilde', text: 'Be yourself; everyone else is already taken'),
    Quote(author: 'Oscar Wilde', text: 'I have nothing to declare except my genius'),
    Quote(author: 'Oscar Wilde', text: 'The truth is rarely pure and never simple')
  ];

  GameService() {
    _loadNewImage(initial: true);
  }

  void _loadNewImage({bool initial = false}) {
    final random = Random();
    final entries = imageCategories.keys.toList();

    Map<String, int> frequencyMap = {};
    for (var img in entries) {
      frequencyMap[img] = previousImages.where((x) => x == img).length;
    }

    List<String> weightedList = [];
    for (var img in entries) {
      int weight = 5 - (frequencyMap[img] ?? 0);
      for (int i = 0; i < weight; i++) {
        weightedList.add(img);
      }
    }

    String newImage;
    do {
      newImage = weightedList[random.nextInt(weightedList.length)];
    } while (!initial && previousImages.contains(newImage));

    currentImage = newImage;
    correctCategory = imageCategories[currentImage]!;

    previousImages.add(currentImage);
    if (previousImages.length > 5) {
      previousImages.removeAt(0);
    }

    selectedCategory = null;
    _resetButtonColors();
    notifyListeners();
  }

  void _resetButtonColors() {
    foodButtonColor = Colors.amber;
    sceneryButtonColor = Colors.amber;
    peopleButtonColor = Colors.amber;
  }

  void checkAnswer(String selected, AnimationController shakeController, AnimationController scaleController) {
    selectedCategory = selected;

    if (selected == correctCategory) {
      correctCount++;
      _setButtonColor(selected, Colors.green);
      isScaling = true;
      scaleController.forward(from: 0);  // Aktifkan animasi scaling
    } else {
      wrongCount++;
      _setButtonColor(selected, Colors.red);
      isShaking = true;
      shakeController.forward(from: 0); // Aktifkan animasi shaking
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      isShaking = false;
      isScaling = false;
      notifyListeners();
    });

    Future.delayed(const Duration(seconds: 1), () {
      _loadNewImage();
      notifyListeners();
    });

    notifyListeners();
  }

  void _setButtonColor(String category, Color color) {
    if (category == 'Food') {
      foodButtonColor = color;
    } else if (category == 'Scenery') {
      sceneryButtonColor = color;
    } else if (category == 'People') {
      peopleButtonColor = color;
    }
    notifyListeners();
  }

  void resetGame() {
    correctCount = 0;
    wrongCount = 0;
    previousImages.clear();
    _loadNewImage();
    notifyListeners();
  }
}
