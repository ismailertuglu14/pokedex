import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex/screens/mainscreen.dart';
import 'package:poke_dex/services/pokedex_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    PokeApi.getPokemonData();
    return ScreenUtilInit(
      designSize: const Size(412, 867),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Scaffold(
          body: MainScreen(),
        ),
      ),
    );
  }
}
