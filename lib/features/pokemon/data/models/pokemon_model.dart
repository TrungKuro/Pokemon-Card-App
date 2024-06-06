import 'sub_models.dart';
import '../../../../../core/constants/constants.dart';
import '../../business/entities/pokemon_entity.dart';

/* ------------------------------------------------------------------------- */

class PokemonModel extends PokemonEntity {
  const PokemonModel({
    required super.id,
    required super.name,
    required SpritesModel super.sprites,
    required List<TypesModel> super.types,
  });

  /* ----------------------------------------------------------------------- */

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json[kId],
      name: json[kName],
      sprites: SpritesModel.fromJson(json[kSprites]),
      types: TypesModel.fromJson(json[kTypes]),
    );
  }

  /* ----------------------------------------------------------------------- */

  Map<String, dynamic> toJson() {
    return {
      kId: id,
      kName: name,
      kSprites: sprites,
      kTypes: types,
    };
  }
}
