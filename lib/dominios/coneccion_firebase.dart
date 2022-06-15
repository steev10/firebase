import 'package:firebase_database/firebase_database.dart';
import '../entidades/response_fb.dart';

class FirebaseConnection {
  //devuelve la instancia de la base de datos
  static final FirebaseDatabase _database = FirebaseDatabase.instance;

  DatabaseReference instanceFirebase() {
    return _database.ref('/registros');
  }

  Future<ResponseFirebase> getAllRegistros() async {
    try {
      DatabaseReference _registros = instanceFirebase();
      DataSnapshot response = await _registros.get();
      print('-----------------------------');
      print(response.value);
      final respuesta = response.value;
      final responseMap = Map<String, dynamic>.from(response.value as Map);
      final lista = responseMap.values.toList();
      final registers = ResponseFirebase.fromJson(lista);
      return registers;
    } catch (e) {
      rethrow;
    }
  }
}
