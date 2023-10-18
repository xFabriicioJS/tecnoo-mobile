class Endereco {
  final int id;

  final String cep;

  final String logradouro;

  final String numero;

  final String? complemento;

  final String bairro;

  final String cidade;

  final String estado;

  Endereco({
    required this.id,
    required this.cep,
    required this.logradouro,
    required this.numero,
    this.complemento,
    required this.bairro,
    required this.cidade,
    required this.estado,
  });

  factory Endereco.fromJSON(Map<String, dynamic> json) {
    return Endereco(
      id: json['id'],
      cep: json['cep'],
      logradouro: json['logradouro'],
      numero: json['numero'],
      bairro: json['bairro'],
      cidade: json['cidade'],
      estado: json['estado'],
    );
  }
}
