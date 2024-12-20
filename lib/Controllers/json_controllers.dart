import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:superhero_application/Model/superheros_model.dart';

class JsonControllers extends GetxController {
  RxList superheroes = <SuperheroesModel>[].obs;
  RxList favorites = <SuperheroesModel>[].obs;
  final GetStorage _storage = GetStorage();

  JsonControllers() {
    loadJsonData();
    loadFavorites();
  }

  Future<void> loadJsonData() async {
    String jsonPath = "lib/Assets/superheros.json";
    String jsonData = await rootBundle.loadString(jsonPath);
    List<dynamic> jsonList = jsonDecode(jsonData);

    superheroes.value =
        jsonList.map((json) => SuperheroesModel.fromJson(json)).toList();
  }

  void loadFavorites() {
    List storedFavorites = _storage.read<List>("favorites") ?? [];
    favorites.value =
        storedFavorites.map((item) => SuperheroesModel.fromJson(item)).toList();
  }

  void saveFavorites() {
    List favoritesJson = favorites.map((item) => item.toJson()).toList();
    _storage.write("favorites", favoritesJson);
  }

  void addToFav(SuperheroesModel superhero) {
    if (favorites.contains(superhero)) {
      favorites.remove(superhero);
    } else {
      favorites.add(superhero);
    }
    saveFavorites();
  }

  bool isSuperheroFavorite(SuperheroesModel superhero) {
    return favorites.contains(superhero);
  }
}
