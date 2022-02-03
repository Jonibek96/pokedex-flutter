// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:pokedex/pokemon_id.dart';
import 'package:pokedex/lista.dart';

class LitaPokemon extends StatefulWidget {
  const LitaPokemon({Key? key}) : super(key: key);

  @override
  _LitaPokemonState createState() => _LitaPokemonState();
}

class _LitaPokemonState extends State<LitaPokemon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pokedex",
          style: TextStyle(
            fontSize: 18,
            color: Color(0xfff6f6f6),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xffC52018),
      ),
      body: SafeArea(child: Lista()),
    );
  }
}


// String imagem = retorno["sprites"]["other"]["home"]["front_default"];
