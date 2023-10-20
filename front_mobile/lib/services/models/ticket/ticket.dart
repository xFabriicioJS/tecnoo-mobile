import 'package:brasil_fields/brasil_fields.dart';

class Ticket {
  final int id;
  final String? protocolo;
  final String? titulo;
  final String? descricao;
  final int idCliente;
  final DateTime? dataAbertura;
  final DateTime? dataFinalizacao;
  final DateTime? dataLimite;
  final String? status;
  final String? prioridade;
  final String? tipoAtendimento;

  Ticket({
    required this.id,
    this.protocolo,
    this.titulo,
    this.descricao,
    required this.idCliente,
    this.dataAbertura,
    this.dataFinalizacao,
    this.dataLimite,
    this.status,
    this.prioridade,
    this.tipoAtendimento,
  });

  factory Ticket.fromJSON(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'],
      protocolo: json['protocolo'],
      titulo: json['titulo'],
      descricao: json['descricao'],
      idCliente: json['idCliente'],
      dataAbertura: parseDateTime(json['dataAbertura']),
      dataFinalizacao: parseDateTime(json['dataFinalizacao']),
      dataLimite: parseDateTime(json['dataLimite']),
      status: json['status'],
      prioridade: json['prioridade'],
      tipoAtendimento: json['tipoAtendimento'],
    );
  }
}

DateTime? parseDateTime(dynamic value) {
  return value != null ? UtilData.obterDateTimeHora(value) : null;
}
