import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../dominios/coneccion_firebase.dart';
import '../entidades/registros.dart';

class ListView2 extends StatelessWidget {
  ListView2({Key? key}) : super(key: key);
  final List<Map<String, String>> games = [
    {
      "image":
          "https://www.lavanguardia.com/files/og_thumbnail/uploads/2021/09/02/6130d99519f60.png",
      "name": "Roblox"
    },
    {
      "image":
          "https://areajugones.sport.es/wp-content/uploads/2021/02/imagen-2021-02-08-091948-1080x609.jpg",
      "name": "Silent Hill"
    },
    {
      "image":
          "https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/950/public/media/image/2021/07/minecraft-classic-2404703.jpg?itok=bIUJiYXF",
      "name": "Minecraft"
    },
  ];
  @override
  Widget build(BuildContext context) {
    callDatabase();
    return Scaffold(
        appBar: AppBar(title: const Text(' video games')),
        body: ListView.builder(
            itemCount: games.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: Image.network(games[index]["image"]!).image,
                ),
                onTap: () {
                  AlertDialog alert = const AlertDialog(
                      title: Text('no game found'),
                      content: Text(
                          'the game has not been found please tap on another game'));
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },
                title: Text(games[index]["name"]!),
              );
            }));
  }

  static final FirebaseDatabase _database = FirebaseDatabase.instance;

  DatabaseReference instanceFirebase() {
    return _database.ref('/registros');
  }

  void callDatabase() async {
    DatabaseReference _registros = instanceFirebase();
    DataSnapshot response = await _registros.get();
    print('-----------------------------');
    print(response.value);
  }
}
