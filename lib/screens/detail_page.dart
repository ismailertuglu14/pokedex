import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex/constants/ui_helper.dart';
import 'package:poke_dex/model/pokemon_model.dart';
import 'package:poke_dex/widgets/poke_information.dart';
import 'package:poke_dex/widgets/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = 'images/pokeball.png';
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                iconSize: 18.w,
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            PokeNameType(pokemon: pokemon),
            SizedBox(height: 20.h),
            SizedBox(height: 20.h),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    child: Image.asset(
                      pokeballImageUrl,
                      fit: BoxFit.fitHeight,
                    ),
                    right: 0,
                    top: 0.02.sh,
                    height: 0.15.sh,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    top: 0.15.sh,
                    child: PokeInformation(
                      pokemon: pokemon,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.img ?? '',
                      height: 0.25.sh,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
