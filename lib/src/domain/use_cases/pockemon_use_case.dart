import 'package:dartz/dartz.dart';
import 'package:pokedex/pokedex.dart';
import 'package:riverpod_example/src/core/error/failure.dart';
import 'package:riverpod_example/src/data/repositories/pockemon_repository.dart';

import '../../core/error/exception.dart';
import '../../core/network/network_info.dart';

//  caught pokemons: Save a pokemon as part of caught pokemons list
//  save user's pokemons
// CRUD grupped Pokemon as teams up five per group

class PockemonUseCase {
  PockemonRepository repository = PockemonRepository();

  Future<Either<Failure, Pokemon?>> getPokemon({int? id, String? name}) async {
    bool connected = await NetworkInfo.instance.isConnected();
    if (connected) {
      try {
        var pokemon = await repository.getPokemon(id: id);
        if (pokemon != null) {
          return Right(pokemon);
        } else {
          return Left(WtfFailure(exception: 'No data found'));
        }
      } on Exception catch (exception) {
        return Left(exception.toFailure());
      }
    } else {
      return Left(WtfFailure(exception: 'No connection found'));
    }
  }

  Future<List<Pokemon>> getPokemonList(
      {required int limit, required int offset}) async {
    bool connected = await NetworkInfo.instance.isConnected();
    if (connected) {
      return await repository.getPokemons(limit: limit, offset: offset);
      // try {
      //   var pokemonList =
      //       await repository.getPokemons(limit: limit, offset: offset);

      //   return Right(pokemonList);
      // } on Exception catch (exception) {
      //   throw exception;
      // }
    } else {
      throw Left(WtfFailure(exception: 'No connection found'));
    }
  }
}
 
 


  // Future<List<Pokemon>> getPokemons({required int limit, required int offset});
  // Future<PokemonColor> getColor({int? id, String? name});