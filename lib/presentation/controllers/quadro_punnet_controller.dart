import 'package:flutter/material.dart';
import 'package:genetica/domain/cases/quadro_punnet.dart';
import 'package:genetica/domain/models/alelo.dart';
import 'package:genetica/domain/models/genotipo.dart';

class QuadroPunnetController extends ChangeNotifier {
  Map<int, String> genotipos = {};

  List<Alelo> resultado = [];

  void setGenotipo(String genotipo, int index) {
    genotipos[index] = genotipo;
  }

  void calcular() {
    List<Genotipo> genotiposTemp = [];

    genotipos.forEach((index, genotipo) {
      genotiposTemp.add(Genotipo(
          alelos: genotipo
              .split('')
              .map((simbolo) => Alelo(simbolo: simbolo))
              .toList()));
    });

    var quadro = QuadroPunnetDomain();
    quadro.setQuadroPunnet(genotiposTemp[0].alelos, genotiposTemp[1].alelos);
    resultado = quadro.execute();
    notifyListeners();
  }
}
