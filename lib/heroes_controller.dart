import 'package:flutter/foundation.dart';
import 'package:hero/hero_model.dart';

class HeroesController extends ChangeNotifier {
  List<HeroModel> heroes = [
    HeroModel(name: 'Batman'),
    HeroModel(name: 'Omni-man'),
    HeroModel(name: 'Deadpool'),
    HeroModel(name: 'Arseface'),
    HeroModel(name: 'Cloud')
  ];

  checkFavorite(HeroModel model) {
    model.isFavorite = !model.isFavorite;
    notifyListeners();
  }
}
