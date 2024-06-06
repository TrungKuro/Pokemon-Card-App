import 'sub_entites.dart';

/* ------------------------------------------------------------------------- */

//! https://pokeapi.co/api/v2/pokemon/{id or name}/
//
//  - [id]
//  - [name]
//  - [sprites]
//    - [other]
//      - [official-artwork]
//        - [front_default]
//        - [front_shiny]
//  - [types]
//    - [type]

/* ------------------------------------------------------------------------- */

class PokemonEntity {
  /* -------------------------------- Object ------------------------------- */
  final int id;
  final String name;
  final SpritesEntity sprites;
  final List<TypesEntity> types;
  /* ----------------------------- Hàm xây dựng ---------------------------- */
  const PokemonEntity({
    required this.id,
    required this.name,
    required this.sprites,
    required this.types,
  });
  /* ----------------------------------------------------------------------- */
}
