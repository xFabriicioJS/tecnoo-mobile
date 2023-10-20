class ClientLoginRequest {
  final String loginUsuario;
  final String senha;

  ClientLoginRequest({
    required this.loginUsuario,
    required this.senha,
  });

  factory ClientLoginRequest.fromJSON(Map<String, dynamic> json) {
    return ClientLoginRequest(
      loginUsuario: json['loginUsuario'],
      senha: json['senha'],
    );
  }

  Map<String, String> toJSON() {
    return {
      'loginUsuario': loginUsuario,
      'senha': senha,
    };
  }
}
