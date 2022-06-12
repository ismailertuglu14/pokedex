import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex/constants/const.dart';
import 'package:poke_dex/constants/ui_helper.dart';
import 'package:poke_dex/model/pokemon_model.dart';
import 'package:poke_dex/screens/detail_page.dart';
import 'package:poke_dex/widgets/poke_img_and_ball.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeListItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(pokemon: pokemon),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        elevation: 3,
        shadowColor: Colors.white,
        color: UIHelper.getColorFromType(pokemon.type![0]),
        child: Padding(
          padding: UIHelper.getDefaultPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(pokemon.name ?? 'N/A', style: Constants.pokemonNameStyle()),
              Chip(
                label: Text(pokemon.type![0], style: Constants.chipStyle()),
              ),
              Expanded(child: PokeImageAndBall(pokemon: pokemon)),
            ],
          ),
        ),
      ),
    );
  }
}
