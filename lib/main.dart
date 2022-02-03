import 'package:flutter/material.dart';

import 'package:pokedex/home.dart';
// import 'package:pokedex/lista.dart';
// import 'package:pokedex/lista_pokemon.dart';

void main() {
  runApp(const MaterialApp(
    // localizationsDelegates: [
    //   // ... app-specific localization delegate[s] here
    //   GlobalMaterialLocalizations.delegate,
    //   GlobalWidgetsLocalizations.delegate
    // ],
    // //ignore: always_specify_types

    // supportedLocales: [
    //   // const Locale('en', ''), // Inglês
    //   Locale('pt', 'BR'), // Português
    // ],
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}
