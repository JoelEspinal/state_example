
import 'package:pokedex/pokedex.dart';
import 'package:riverpod_example/src/core/pockedex_wraper.dart';

import './../../domain/repositories/pockemon_repository.dart';

class PockemonRepository extends PokemonDomainRepository {

  var pokedex =  PockedexWraper.instance.pockedex!;

  @override
  Future<List<Pokemon>> getPokemons(
      {required int limit, required int offset}) async {
    var result = await pokedex.pokemon.getPage(limit: limit, offset: offset);

    var res = await Future.wait(
      result.results.map((element) async {
      var pokemon = await pokedex.pokemon.getByUrl(element.url);
      return pokemon;
    })
    );

    return Future.value(res);
  }

  @override
  Future<Pokemon?> getPokemon({int? id, String? name}) async {
    return await PockedexWraper.instance.pockedex!.pokemon.get(id: id);
  }

  @override
  Future<PokemonColor?> getColor({int? id, String? name}) async {
    var pokemonColor = await PockedexWraper.instance.pockedex!.pokemonColors
        .get(id: id, name: name);

    return pokemonColor;
  }
}
