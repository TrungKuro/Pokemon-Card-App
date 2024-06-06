/* ------------------------------------------------------------------------- */

//! https://pokeapi.co/api/v2/pokemon/{id or name}/
//
//  - [id]
//  - [name]
//  - [sprites]
//    - [other]
//      - [official-artwork]
//        - [front_default] ... "path"
//        - [front_shiny] ... "path"
//  - [types]
//    - [type]

/* ------------------------------------------------------------------------- */

class PokemonImageEntity {
  // Object
  final String path;
  // Hàm xây dựng
  const PokemonImageEntity({required this.path});
}
