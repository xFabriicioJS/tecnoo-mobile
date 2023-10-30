// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brasil_fields/brasil_fields.dart';
import 'package:front_mobile/services/models/historico_chamado/historico.dart';

class Ticket {
  final int id;
  final String? protocolo;
  final String? titulo;
  final String? descricao;
  final int idCliente;
  final DateTime dataAbertura;
  final DateTime? dataFinalizacao;
  final DateTime? dataLimite;
  final String? status;
  final String? prioridade;
  final String? tipoAtendimento;
  final List<HistoricoChamadoModel?>? historicos;

  Ticket({
    required this.id,
    this.protocolo,
    this.titulo,
    this.descricao,
    required this.idCliente,
    required this.dataAbertura,
    this.dataFinalizacao,
    this.dataLimite,
    this.status,
    this.prioridade,
    this.tipoAtendimento,
    this.historicos,
  });

  factory Ticket.fromJSON(Map<String, dynamic> json) {
    List<HistoricoChamadoModel?>? historicos = [];

    if (json['historicos'] != null) {
      json['historicos'].forEach((v) {
        historicos.add(HistoricoChamadoModel.fromJson(v));
      });
    }

    return Ticket(
        id: json['id'],
        protocolo: json['protocolo'],
        titulo: json['titulo'],
        descricao: json['descricao'],
        idCliente: json['idCliente'],
        dataAbertura: parseDateTime(json['dataAbertura'])!,
        dataFinalizacao: parseDateTime(json['dataFinalizacao']),
        dataLimite: parseDateTime(json['dataLimite']),
        status: json['status'],
        prioridade: json['prioridade'],
        tipoAtendimento: json['tipoAtendimento'],
        historicos: historicos);
  }

  @override
  String toString() {
    return 'Ticket(id: $id, protocolo: $protocolo, titulo: $titulo, descricao: $descricao, idCliente: $idCliente, dataAbertura: $dataAbertura, dataFinalizacao: $dataFinalizacao, dataLimite: $dataLimite, status: $status, prioridade: $prioridade, tipoAtendimento: $tipoAtendimento, historicos: $historicos)';
  }
}

DateTime? parseDateTime(dynamic value) {
  return value != null ? UtilData.obterDateTimeHora(value) : null;
}
