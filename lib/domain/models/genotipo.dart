import 'package:genetica/domain/models/alelo.dart';

class Genotipo {
  final List<Alelo> alelos;

  Genotipo({required this.alelos});

  factory Genotipo.fromString(String genotipo) {
    final List<Alelo> alelos = [];
    for (final char in genotipo.split('')) {
      alelos.add(Alelo(simbolo: char));
    }
    return Genotipo(alelos: alelos);
  }
}
