import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_app/src/models/pokemon_model.dart';

class PokemonProvider {
  Future<List<PokemonModel>> getPokemon() async {
    final url = Uri.parse('https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    if(decodedData.containsKey('pokemon')) {
      final dataClass = new CastPokemon.fromJsonList(decodedData['pokemon']);
      return dataClass.pokemons;
    } else {
      return [];
    }    
  }
}