import 'package:flutter/material.dart';
import 'package:pokedex/lista.dart';

import 'pokemon_id.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controllerPokemon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextEditingController _nome = _controllerPokemon;
    return Scaffold(
      backgroundColor: const Color(0xffcccccc),
      body: SafeArea(
          child: Container(
        // width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.only(bottom: 76),
                child: Image.asset("assets/pokedex.png")),
            Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Lista()),
                  );
                },
                icon: const Icon(Icons.list),
                label: const Text("Lista de pokemons:"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 56),
                  primary: const Color(0xffCC0000),
                  onPrimary: Colors.white,
                  textStyle: const TextStyle(
                    // color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
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
                            color: Color(0xffCC0000),
                          ),
                        ),
                      ),
                      controller: _controllerPokemon,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PokemonId(_nome.value.text)),
                      );
                    },
                    icon: const Icon(Icons.search),
                    label: const Text("Enviar"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 48),
                      primary: const Color(0xffCC0000),
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
          ],
        ),
      )),
    );
  }
}
