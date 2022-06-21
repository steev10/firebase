import 'servicio.dart';

import 'carro.dart';

class Registros {
  final Carro? carro;
  final Servicio? servicio;
  final String? apellido;
  final int? telefono;
  final int? licencia;
  final String? nombre;
  final String? image;

  Registros(
      {this.carro,
      this.servicio,
      this.apellido,
      this.telefono,
      this.licencia,
      this.nombre,
      this.image});

  factory Registros.fromJson(Map<String, dynamic> json) {
    return Registros(
      carro: json['carro'] != null
          ? Carro.fromJson(Map<String, dynamic>.from(json['carro'] as Map))
          : null,
      servicio: json['servicio'] != null
          ? Servicio.fromJson(
              Map<String, dynamic>.from(json['servicio'] as Map))
          : null,
      apellido: json['apellido'],
      telefono: json['telefono'],
      licencia: json['licencia'],
      nombre: json['nombre'],
      image: json['image'],
    );
  }
}
