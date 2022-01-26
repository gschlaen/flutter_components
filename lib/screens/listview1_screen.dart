import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {
  final options = const ['Megaman', 'Metal Gear', 'Super Smash', 'Final Fantasy'];

  const Listview1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview Tipo 1'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // El operador spread ... separa los items de una lista
          // en este caso se usa porque necesito widgwts y no una lista de widgets
          ...options.map(
            (e) => ListTile(
              title: Text(e),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
