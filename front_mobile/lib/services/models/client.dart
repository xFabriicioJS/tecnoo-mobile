import 'package:front_mobile/services/models/e_role.dart';
import 'package:front_mobile/services/models/endereco.dart';

class ClientModel {
  final String type;
  final int id;
  final String username;
  final String email;
  final String nome;
  final List<Role> roles;
  final String telefone;
  final String? cnpj;
  final String? razaoSocial;
  final int idTipo;
  final Endereco endereco;

  ClientModel({
    required this.type,
    required this.id,
    required this.username,
    required this.email,
    required this.nome,
    required this.roles,
    required this.telefone,
    this.cnpj,
    this.razaoSocial,
    required this.idTipo,
    required this.endereco,
  });

  // Método auxiliar para converter o JSON em um objeto

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      type: json['type'],
      id: json['id'],
      username: json['username'],
      email: json['email'],
      nome: json['nome'],
      roles: json['roles'],
      telefone: json['telefone'],
      cnpj: json['cnpj'],
      razaoSocial: json['razaoSocial'],
      idTipo: json['idTipo'],
      endereco: json['endereco'],
    );
  }
}
