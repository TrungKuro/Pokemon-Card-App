class NoParams {}

class TemplateParams {}

/* ------------------------------------------------------------------------- */

//! Các tham số cung cấp cho API
//! API: https://pokeapi.co/api/v2/pokemon/{id or name}/

class PokemonParams {
  // Cung cấp tham số [id]
  final String id;

  // Hàm xây dựng
  const PokemonParams({required this.id});
}

/* ------------------------------------------------------------------------- */
class PokemonImageParams {
  final String name;
  final String imageUrl;

  // Hàm xây dựng
  const PokemonImageParams({
    required this.name,
    required this.imageUrl,
  });
}
