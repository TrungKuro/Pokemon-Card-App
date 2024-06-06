import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/errors/exceptions.dart';
import '../models/pokemon_model.dart';

/* ------------------------------------------------------------------------- */

abstract class PokemonLocalDataSource {
  Future<PokemonModel> getLastPokemon();
  Future<void>? cachePokemon(PokemonModel? pokemonToCache);
}

/* ------------------------------------------------------------------------- */

const cachedPokemon = 'CACHED_POKEMON'; //!

/* ------------------------------------------------------------------------- */

class PokemonLocalDataSourceImpl implements PokemonLocalDataSource {
  // Object
  //! Sử dụng tính năng của gói "shared_preferences"
  final SharedPreferences sharedPreferences;

  // Hàm xây dựng
  PokemonLocalDataSourceImpl({required this.sharedPreferences});

  /* ----------------------------------------------------------------------- */

  @override
  Future<PokemonModel> getLastPokemon() {
    // Truy cập data hiện có trong CACHE
    final jsonString = sharedPreferences.getString(cachedPokemon);
    /* -------------------- Nếu data trong CACHE hợp lệ -------------------- */
    if (jsonString != null) {
      return Future.value(PokemonModel.fromJson(json.decode(jsonString)));
    }
    /* ------------------- Nếu data trong CACHE ko hợp lệ ------------------ */
    else {
      throw CacheException();
    }
  }

  /* ----------------------------------------------------------------------- */

  @override
  Future<void>? cachePokemon(PokemonModel? pokemonToCache) async {
    /* ---------------- Nếu data hợp hợp, cho lưu vào CACHE ---------------- */
    if (pokemonToCache != null) {
      sharedPreferences.setString(
        cachedPokemon,
        json.encode(
          pokemonToCache.toJson(),
        ),
      );
    }
    /* -------------- Nếu data ko hợp lệ, ko cho lưu vào CACHE ------------- */
    else {
      throw CacheException();
    }
  }
}
