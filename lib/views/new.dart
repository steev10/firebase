import 'package:flutter/material.dart';
import '../dominios/coneccion_firebase.dart';
import '../entidades/registros.dart';

class CallFirebase extends StatefulWidget {
  const CallFirebase({Key? key}) : super(key: key);

  @override
  State<CallFirebase> createState() => _CallFirebaseState();
}

class _CallFirebaseState extends State<CallFirebase> {
  final conexion = FirebaseConnection();
  List<Registros> registros = [];
  @override
  Widget build(BuildContext context) {
    callDatabase();
    return Scaffold(
        appBar: AppBar(title: const Text('marcas de carros')),
        body: ListView.builder(
            itemCount: registros.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                    backgroundImage:
                        Image.network(registros[index].image!).image),
                title: Text(
                    '${registros[index].nombre!} ${registros[index].apellido!}'),
                onTap: () {
                  AlertDialog alert = const AlertDialog(
                      title: Text('no client found'),
                      content: Text(
                          'the client has not been found please tap on another client'));
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },
              );
            }));
  }

  void callDatabase() async {
    final response = await conexion.getAllRegistros();
    if (registros.isEmpty) {
      setState(() {
        registros = response.registros!;
        print(registros);
      });
    }
  }
}
