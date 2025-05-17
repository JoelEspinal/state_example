import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pokedex/pokedex.dart';
import '../pockeball_icon.dart';
import '../pockemon_modal.dart';

import './home_provider.dart';
import '../camera_icon.dart';
import '../pockemon_group_icon.dart';
import '../pockemon_groups_modal.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  List<Pokemon> pokemonList = List.empty(growable: true);

  int pokemonLimit = 10;
  int pokemonOffset = 0;

  var pokemonOffsetListAsync;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    getPokemonList(context, ref);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.0,
        title: const Center(child: Text('Pokedex')),
        centerTitle: true,
        backgroundColor: Colors.red.shade600,
        leading: IconButton(
            icon: CameraIcon(center: const Icon(Icons.unfold_more_outlined)),
            onPressed: () async {
              getPokemonList(context, ref);
            }),
      ),
      body: Stack(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final pokemonListAsync = ref.watch(pokemonListOffsetProvider(
                  PokemonListParams(paramList: [pokemonLimit, pokemonOffset])));

              return pokemonListAsync.when(
                data: (data) {
                  addPokemons(data);

                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var pokemon = pokemonList[index];
                      return Card(
                        child: ListTile(
                          title: Text(pokemon.name),
                          subtitle: Text(pokemon.id.toString()),
                        ),
                      );
                    },
                    itemCount: pokemonList.length,
                  );
                },
                error: (error, stackTrace) {
                  return Center(
                    child: Text("Error: $error"),
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (value) {},
        destinations: [
          NavigationDestination(
            label: 'Cauched',
            icon: GestureDetector(
              onVerticalDragEnd: (DragEndDetails details) =>
                  _showModalSheet(context, const PockemonCatchedModal()),
              onTap: () async {
                // await ref.read(await HomeProvider().homePokemonProvider());
                _showModalSheet(context, const PockemonCatchedModal());
              },
              child: const PockeballIcon(),
            ),
          ),
          NavigationDestination(
            label: 'Groups',
            icon: GestureDetector(
              onVerticalDragEnd: (DragEndDetails details) =>
                  _showModalSheet(context, const PockemonGroupsModal()),
              onTap: () async =>
                  _showModalSheet(context, const PockemonGroupsModal()),
              child: const PockemonGroupIcon(),
            ),
          ),
        ],
      ),
    );
  }

  void addPokemons(List<Pokemon> pokemons) {
    for (var element in pokemons) {
      if (!pokemonList.contains(element)) {
        pokemonList.add(element);
      }
    }
  }

  void getPokemonList(BuildContext context, ref) async {
    PokemonListParams params =
        PokemonListParams(paramList: [pokemonLimit, pokemonOffset]);
    pokemonOffsetListAsync = await ref.watch(pokemonListOffsetProvider(params));

    switch (pokemonOffsetListAsync) {
      case AsyncData(:final List<Pokemon> value):
        addPokemons(value);
        pokemonLimit += 10;
        break;
      case AsyncLoading():
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Loading..."),
          ),
        );
        break;
      case AsyncError(:final error):
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: $error"),
            duration: const Duration(seconds: 2),
          ),
        );
        break;
      default:
        break;
    }
  }

  _showModalSheet(BuildContext context, Widget sheet) {
    showBarModalBottomSheet(context: context, builder: (context) => sheet);
  }

  static bool get isBuilding => [
        SchedulerPhase.transientCallbacks,
        SchedulerPhase.midFrameMicrotasks,
        SchedulerPhase.persistentCallbacks,
      ].contains(WidgetsBinding.instance.schedulerPhase);
}
