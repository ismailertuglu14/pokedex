import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poke_dex/constants/ui_helper.dart';
import 'package:poke_dex/model/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImageAndBall({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = 'images/pokeball.png';

    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(pokeballImageUrl,
              width: UIHelper.calculatePokeImgAndBallSize(),
              height: UIHelper.calculatePokeImgAndBallSize(),
              fit: BoxFit.fitHeight),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: CachedNetworkImage(
            imageUrl: pokemon.img!,
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: UIHelper.calculatePokeImgAndBallSize(),
            height: UIHelper.calculatePokeImgAndBallSize(),
            fit: BoxFit.fitHeight,
            //Veri gelene kadar yerini CircularProggressInducator ile tutuyor!
            placeholder: (context, url) => CircularProgressIndicator(
              color: UIHelper.getColorFromType(pokemon.type![0]),
            ),
          ),
        ),
      ],
    );
  }
}
