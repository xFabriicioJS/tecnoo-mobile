import 'package:front_mobile/services/models/client/client.dart';
import 'package:front_mobile/services/models/endereco.dart';

class ClientLoginResponse extends ClientModel {
  final String token;
  final String tokenType;
  final String accessToken;

  ClientLoginResponse({
    required String type,
    required int id,
    required String username,
    required String email,
    required String nome,
    required List<dynamic> roles,
    required String telefone,
    String? cnpj,
    String? razaoSocial,
    required int idTipo,
    required Endereco endereco,
    required this.token,
    required this.tokenType,
    required this.accessToken,
  }) : super(
          type: type,
          id: id,
          username: username,
          email: email,
          nome: nome,
          roles: roles,
          telefone: telefone,
          cnpj: cnpj,
          razaoSocial: razaoSocial,
          idTipo: idTipo,
          endereco: endereco,
        );

  // Método fractory para converter o JSON em um objeto

  factory ClientLoginResponse.fromJSON(Map<String, dynamic> json) {
    return ClientLoginResponse(
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
      endereco: Endereco.fromJSON(json['endereco']),
      token: json['token'],
      tokenType: json['tokenType'],
      accessToken: json['accessToken'],
    );
  }
}
