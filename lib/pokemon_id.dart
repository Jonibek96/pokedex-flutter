// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokemonId extends StatefulWidget {
  // const PokemonId({Key? key}) : super(key: key);

  String? nome;
  PokemonId([this.nome]);

  @override
  _PokemonIdState createState() => _PokemonIdState();
}

class _PokemonIdState extends State<PokemonId> {
  final TextEditingController _controllerPokemon = TextEditingController();
  String _nome = "Nenhum pokemon encontrado";
  String _id = '#';
  String _altura = "";
  String _peso = "";
  String _habilidade = "";
  String _imagem = "";
  String _tipo = "";
  String _descHab = "";

  _recuperar() async {
    var pokemonNome = _controllerPokemon.text;

    String url = "https://pokeapi.co/api/v2/pokemon/$pokemonNome/";

    http.Response response;
    response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);

    int id = retorno["id"];
    String nome = retorno["name"];
    int altura = retorno["height"];
    int peso = retorno["weight"];

    String habilidade = retorno["abilities"][0]["ability"]["name"];

    String imagem = retorno["sprites"]["other"]["home"]["front_default"];
    String tipo = retorno["types"][0]["type"]["name"];

    String urlHab = "https://pokeapi.co/api/v2/ability/$id/";
    http.Response responseHabilidade = await http.get(Uri.parse(urlHab));
    Map<String, dynamic> retornoHab = json.decode(responseHabilidade.body);
    String descHab = retornoHab["effect_entries"][0]["effect"];

    setState(() {
      _nome = nome;
      _id = "#${id.toString()}";
      _altura = "Altura: ${altura.toString()} ";
      _peso = " Peso: ${peso.toString()} ";
      _habilidade = "Habilidade principal: $habilidade";
      _imagem = imagem;
      _tipo = "Tipo: $tipo";
      _descHab = descHab;
    });
  }

  _carregarPokemon(String? pokemonNome) async {
    String url2 = "https://pokeapi.co/api/v2/pokemon/${pokemonNome}/";
    http.Response resposta;
    resposta = await http.get(Uri.parse(url2));
    Map<String, dynamic> retorno = json.decode(resposta.body);

    int id = retorno["id"];
    String nome = retorno["name"];
    int altura = retorno["height"];
    int peso = retorno["weight"];

    String habilidade = retorno["abilities"][0]["ability"]["name"];

    String imagem = retorno["sprites"]["other"]["home"]["front_default"];
    String tipo = retorno["types"][0]["type"]["name"];

    String urlHab = "https://pokeapi.co/api/v2/ability/$id/";
    http.Response responseHabilidade = await http.get(Uri.parse(urlHab));
    Map<String, dynamic> retornoHab = json.decode(responseHabilidade.body);
    String descHab = retornoHab["effect_entries"][0]["effect"];
    print(widget.nome);

    setState(() {
      _nome = nome;
      _id = "#${id.toString()}";
      _altura = "Altura: ${altura.toString()} ";
      _peso = " Peso: ${peso.toString()} ";
      _habilidade = "Habilidade principal: $habilidade";
      _imagem = imagem;
      _tipo = "Tipo: $tipo";
      _descHab = descHab;
      widget.nome = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    _carregarPokemon(widget.nome);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "POKEDEX",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xfff6f6f6),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffC52018),
      ),
      backgroundColor: const Color(0xffeeeeee),
      body: SafeArea(
        child: SingleChildScrollView(
          // padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 35,
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          fillColor: Color(0xffdddddd),
                          filled: true,
                          labelText: "Digite o nome do pokemon desejado:",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffCC0000),
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.zero,
                              bottomRight: Radius.zero,
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                          contentPadding: EdgeInsets.all(10.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.zero,
                              bottomRight: Radius.zero,
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xffC52018),
                            ),
                          ),
                        ),
                        controller: _controllerPokemon,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: _recuperar,
                      icon: const Icon(Icons.search),
                      label: const Text("Enviar"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 46),
                        primary: const Color(0xffC52018),
                        onPrimary: Colors.white,
                        textStyle: const TextStyle(
                          // color: Colors.black,
                          fontSize: 20,
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.zero,
                            bottomLeft: Radius.zero,
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    alignment: const FractionalOffset(0.0, 1.0),
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 0,
                      bottom: 0,
                    ),
                    // margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      _nome,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Color(0xff222222),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: const FractionalOffset(0.0, 1.0),
                    // margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 0,
                      bottom: 0,
                    ),
                    child: Text(
                      _id,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff666666),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(children: [
                      Positioned(
                        top: 250,
                        left: 0,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          padding: const EdgeInsets.only(
                            top: 82,
                            left: 16,
                            right: 16,
                            bottom: 16,
                          ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                              // Radius.circular(5),
                            ),
                            color: Color(0xffD54040),
                          ),
                          // padding: EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Wrap(
                                children: [
                                  Container(
                                      width: 200,
                                      padding: const EdgeInsets.all(16),
                                      child: Text(
                                        _altura,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xfff6f6f6),
                                          fontWeight: FontWeight.bold,
                                          // backgroundColor: Color(0xff616161),
                                        ),
                                      )),
                                  Container(
                                      // width: 150,
                                      padding: const EdgeInsets.all(16),
                                      child: Text(
                                        _peso,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xfff6f6f6),
                                          fontWeight: FontWeight.bold,
                                          // backgroundColor: Color(0xff616161),
                                        ),
                                      )),
                                  Container(
                                      // width: 200,
                                      padding: const EdgeInsets.all(16),
                                      child: Text(
                                        _tipo,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xfff6f6f6),
                                          fontWeight: FontWeight.bold,
                                          // backgroundColor: Color(0xff616161),
                                        ),
                                      )),
                                  Container(
                                      // width: 200,
                                      padding: const EdgeInsets.all(16),
                                      child: Text(
                                        _habilidade,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xfff6f6f6),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.all(16),
                                      child: Text(
                                        _descHab,
                                        style: const TextStyle(
                                          color: Color(0xfff6f6f6),
                                        ),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: MediaQuery.of(context).size.width / 7,
                        child: Container(
                          // decoration: const BoxDecoration(
                          //   boxShadow: [
                          //     BoxShadow(
                          //       color: Color(0xFF000000),
                          //       spreadRadius: 2,
                          //       blurRadius: 4,
                          //       offset: Offset(0, 3),
                          //     )
                          //   ],
                          // ),
                          child: _imagem == ""
                              ? Image.asset("assets/pokemon.png")
                              : Image(
                                  image: NetworkImage(_imagem),
                                  height: 300,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
