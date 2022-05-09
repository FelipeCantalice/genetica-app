import 'package:genetica/domain/models/alelo.dart';

abstract class QuadroPunnet {
  List<Alelo> get alelos1;
  List<Alelo> get alelos2;

  void setQuadroPunnet(List<Alelo> alelos1, List<Alelo> alelos2);

  List<Alelo> execute();
}
