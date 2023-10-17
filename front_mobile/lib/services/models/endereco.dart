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
}
