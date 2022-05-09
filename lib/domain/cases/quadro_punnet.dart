import 'package:genetica/data/cases/quadro_punnet.dart';
import '../models/alelo.dart';

/// @author: Felipe Cantalice
/// @date: 08/06/2022
/// @modified: 08/06/2022
///
/// @param alelos1, lista de alelos do genotipo 1
/// @param alelos2, lista de alelos do genotipo 2
/// @return List<Alelo>, lista de alelos do resultado
class QuadroPunnetDomain extends QuadroPunnet {
  List<Alelo> _alelos1 = [];
  List<Alelo> _alelos2 = [];

  @override
  List<Alelo> execute() {
    List<Alelo> alelos = [];
    for (int i = 0; i < _alelos1.length; i++) {
      for (int j = 0; j < _alelos2.length; j++) {
        alelos.add(_alelos1[i] + _alelos2[j]);
      }
    }
    // order alelos by simbolo alphabetically
    alelos.sort((a, b) => a.simbolo.compareTo(b.simbolo));
    return alelos;
  }

  @override
  void setQuadroPunnet(List<Alelo> alelos1, List<Alelo> alelos2) {
    _alelos1 = alelos1;
    _alelos2 = alelos2;
  }

  @override
  List<Alelo> get alelos1 => _alelos1;

  @override
  List<Alelo> get alelos2 => _alelos2;
}
