import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pokedex_app/src/models/pokemon_model.dart';
import 'package:pokedex_app/src/providers/pokemon_provider.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pokemonProvider = new PokemonProvider();
  List<PokemonModel> pokemons = [];
  bool isLoading = false;

  @override
  void initState() { 
    super.initState();
    getPokemon().then((resp) => {
      setState((){
        isLoading = false;
      })
    });
  }

  Future<bool> getPokemon() async {
    setState((){
      isLoading = true;
    });
    pokemons = await pokemonProvider.getPokemon();
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokeDex'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Row(
                children: [
                  FaIcon(FontAwesomeIcons.phoenixFramework, size: 30.0, ),
                  SizedBox(width: 10),
                  Text('Pokemon', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 10.0),
              (isLoading)
              ? CircularProgressIndicator()
              : ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: pokemons.length,
                itemBuilder: (context, i) {
                  return _PokemonCard(pokemon: pokemons[i]);
                } 
              )
            ],
          ),
        ),
      )
    );
  }
}

class _PokemonCard extends StatelessWidget {
  final PokemonModel pokemon;

  const _PokemonCard({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Card(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Image.network(pokemon.img, width: 200),
            SizedBox(height: 20),
            Text(pokemon.name)
          ],
        ),
      )
    );
  }
}