import 'package:flutter/material.dart';
import 'package:poke_dex/widgets/app_title.dart';
import 'package:poke_dex/widgets/pokemon_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => Column(
          children: [
            AppTitle(),
            Expanded(child: PokemonList()),
          ],
        ),
      ),
    );
  }
}
