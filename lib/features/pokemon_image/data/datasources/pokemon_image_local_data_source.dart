import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/errors/exceptions.dart';
import '../models/pokemon_image_model.dart';

/* ------------------------------------------------------------------------- */

abstract class PokemonImageLocalDataSource {
  Future<PokemonImageModel> getLastPokemonImage();
  Future<void> cachePokemonImage({required PokemonImageModel? pokemonImageToCache});
}

/* ------------------------------------------------------------------------- */

const cachedPokemonImage = 'CACHED_POKEMON_IMAGE'; //!

/* ------------------------------------------------------------------------- */

class PokemonImageLocalDataSourceImpl implements PokemonImageLocalDataSource {
  // Object
  //! Sử dụng tính năng của gói "shared_preferences"
  final SharedPreferences sharedPreferences;

  // Hàm xây dựng
  PokemonImageLocalDataSourceImpl({required this.sharedPreferences});

  /* ----------------------------------------------------------------------- */

  @override
  Future<PokemonImageModel> getLastPokemonImage() {
    final jsonString = sharedPreferences.getString(cachedPokemonImage);

    if (jsonString != null) {
      return Future.value(PokemonImageModel.fromJson(json: json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  /* ----------------------------------------------------------------------- */

  @override
  Future<void> cachePokemonImage({required PokemonImageModel? pokemonImageToCache}) async {
    if (pokemonImageToCache != null) {
      sharedPreferences.setString(
        cachedPokemonImage,
        json.encode(
          pokemonImageToCache.toJson(),
        ),
      );
    } else {
      throw CacheException();
    }
  }
}
