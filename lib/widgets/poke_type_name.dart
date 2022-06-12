import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex/constants/const.dart';
import 'package:poke_dex/constants/ui_helper.dart';
import 'package:poke_dex/model/pokemon_model.dart';

class PokeNameType extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeNameType({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.05.sh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  pokemon.name ?? '',
                  style: Constants.pokemonNameStyle(),
                ),
              ),
              Text(
                '#${pokemon.num}',
                style: Constants.pokemonNameStyle(),
              ),
            ],
          ),
          SizedBox(height: 0.02.sh),
          Chip(
            label: Text(
              pokemon.type?.join(', ') ?? '',
              style: Constants.chipStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
