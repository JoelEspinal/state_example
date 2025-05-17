import 'package:pokedex/pokedex.dart';

class PockedexWraper {
  PockedexWraper._privateConstructor() {
    _initPokedex();
  }

  static late Pokedex? _pokedex;

  static final PockedexWraper _instance = PockedexWraper._privateConstructor();
  static PockedexWraper get instance => _instance;

  Pokedex? get pockedex => _pokedex;

  Future<Pokedex> _initPokedex() async {
    return _pokedex = Pokedex(client: PokeAPIClient());
  }
}
