import 'package:brasil_fields/brasil_fields.dart';

class HistoricoChamadoModel {
  final int id;
  final String descricao;
  final DateTime dataHistorico;

  HistoricoChamadoModel({
    required this.id,
    required this.descricao,
    required this.dataHistorico,
  });

  @override
  String toString() =>
      'HistoricoChamadoModel(id: $id, descricao: $descricao, data: $dataHistorico)';

  factory HistoricoChamadoModel.fromJson(Map<String, dynamic> json) {
    return HistoricoChamadoModel(
      id: json['id'],
      descricao: json['descricao'],
      dataHistorico: UtilData.obterDateTimeHora(json['dataHistorico']),
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'descricao': descricao,
      'data': dataHistorico.toIso8601String(),
    };
  }
}
