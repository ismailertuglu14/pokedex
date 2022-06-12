import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex/model/pokemon_model.dart';
import 'package:poke_dex/services/pokedex_api.dart';
import 'package:poke_dex/widgets/pokelist_item.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pokemonList = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> _listem = snapshot.data!;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  ScreenUtil().orientation == Orientation.portrait ? 2 : 3,
            ),
            itemCount: _listem.length,
            itemBuilder: (context, index) {
              var oankiPokemon = _listem[index];
              return PokeListItem(pokemon: oankiPokemon);
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Hata Var!'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
