import 'package:pokedex/pokedex.dart';

abstract class PokemonDomainRepository {
  Future<Pokemon?> getPokemon({int? id, String? name});
  Future<List<Pokemon?>?> getPokemons(
      {required int limit, required int offset});
  Future<PokemonColor?> getColor({int? id, String? name});
}
