class Alelo {
  final String simbolo;

  Alelo({required this.simbolo}){
    if (simbolo.length > 2) {
      throw Exception('O simbolo deve ter 2 caracteres');
    }
  }

  Alelo operator +(Alelo other) {
    String alelo = simbolo + other.simbolo;

    List<String> alelos = alelo.split('').toList();
    alelos.sort();
    alelo = alelos.join();
    return Alelo(simbolo: alelo);
  }
}
