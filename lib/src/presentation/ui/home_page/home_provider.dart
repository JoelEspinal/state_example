import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/pokedex.dart';
import 'package:riverpod_example/src/core/error/exception.dart';
import './../../../domain/use_cases/pockemon_use_case.dart';

final PockemonUseCase _pokemonUseCase = PockemonUseCase();

final pokemomProvider = FutureProvider.family<Pokemon?, int>(
  (ref, pokemonId) async {
    var pok;
    var raw = await _pokemonUseCase.getPokemon(id: pokemonId);
    raw.fold((failure) {
      pok = Future.value(failure);
    }, (pokemon) {
      if (pokemon == null) {
        pok = Future.value(NotDataException());
      } else {
        pok = Future<Pokemon?>.value(pokemon);
        return pok;
      }
    });

    return Future<Pokemon?>.value(pok);
  },
);

final pokemonListOffsetProvider =
    FutureProvider.family<List<Pokemon>, PokemonListParams>(
        (ref, params) async {
  int limit = params.paramList[0];
  int offset = params.paramList[1];
  return _pokemonUseCase.getPokemonList(limit: limit, offset: offset);
});

// return await _pokemonUseCase.getPokemonList(limit: limit, offset: offset);

// return raw.fold((failure) {
//   return Future.value(failure);
// }, (pokemons) {
//   if (pokemons == null) {
//     return Future.value(NotDataException());
//   } else {
//     return Future<List<Pokemon>?>.value(pokemons);
//   }
// });

// raw.fold((failure) {
//   return Future.value(failure);
// }, (pokemon) {
//   if (pokemon == null) {
//     return Future.value(NotDataException());
//   } else {
//     return Future<List<Pokemon>>.value(pokemon);
//   }
// });
//   },
// );

class PokemonListParams extends Equatable {
  final List<int> paramList;

  const PokemonListParams({required this.paramList});

  @override
  List<Object?> get props => [paramList];
}


// final pokmeonOffsetList2= FutureProvider.family<List<Pokemon>?, int, int>(ref, limit, offset) async {
//     var raw = await _pokemonUseCase.getPokemonList(limit: limit, offset: offset);
//     var pokemonList;

//     raw.fold((failure) {  
//         pokemonList = Future.value(failure);
//       }, (pokemonList) {
//         if (pokemonList == null) {
//           pokemonList = Future.value(NotDataException());
//         } else {
//           pokemonList = Future<Pokemon?>.value(pokemonList);
//           return pokemonList;
//         }
//       },
      
//       );

//            return Future<Pokemon?>.value(pokemonList);

// };




//     raw.fold((fail) {
//        return Future.value(fail);
//     }, (pokemon?)) {
//       return Future.value(Right(pokemon));
// }

    // pokemon.fold((f) {
    //   return Future.value(f);
    // }, (foundPokemon) {
    //   Future.value(Right(foundPokemon))
    // });



// @riverpod
// class HomeProvider extends _$HomeProvider {
//   @override
//   String build() {
//     return 'init';
//   }

//   Future<Pokemon?> homePokemonProvider<Pokemon>() async {
//     final foundPokemon = await _pokemonUseCase.getPokemon(id: 2);
//     foundPokemon.fold((failure) {
//       return Future.error(failure);
//     }, (foundPokemon) {
//       return Future.value(foundPokemon);
//     });

//     return null;
//   }
// }

  // Future<Pokemon?> getPokemon(id) async {
  //   var pokemon = await _pokemonUseCase.getPokemon(id: 2);
  //   pokemon.fold((failure) {
  //     return Future.error(failure);
  //   }, (foundPokemon) {
  //     return Future.value(foundPokemon);
  //   });

  //   return null;
  // }
// }

// @riverpod
// final pokemonProvider =
//     StateProvider.autoDispose<Pokemon>((Ref ref, int id) async {
//   var pokemon = await _pokemonUseCase.getPokemon(id: 2);

//   pokemon.fold((failure) {
//     return Future.error(failure);
//   }, (foundPokemon) {
//     return Future.value(foundPokemon);
//   });

//   return null;
// });

// @riverpod
// Future<Pokemon?> fetchPokemonProvider(Ref ref) async {
//   final pokemon = await _pokemonUseCase.getPokemon(id: 2);

//   pokemon.fold((failure) {
//     return Future.error(failure);
//   }, (foundPokemon) {
//     return Future.value(foundPokemon);
//   });

//   return null;
// }
