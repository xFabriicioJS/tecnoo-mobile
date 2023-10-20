import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:front_mobile/components/error/snackbars.dart';
import 'package:front_mobile/controllers/client_controller.dart';
import 'package:front_mobile/services/models/client/client.dart';
import 'package:front_mobile/services/models/client/client_login_response.dart';
import 'package:front_mobile/services/token/token_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginAuthService extends GetxController {
  RxBool isLoggedIn = false.obs;

  final TokenService _tokenService = TokenService();

  ClientController clientController = ClientController();

  CustomSnackbars customSnackbar = CustomSnackbars();

  Future<void> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('${dotenv.env['API_URL']}/api/auth/cliente/signin'),
        body: jsonEncode({'loginUsuario': username, 'senha': password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        isLoggedIn.value = true;

        ClientLoginResponse clientLoginResponse =
            ClientLoginResponse.fromJSON(json.decode(response.body));

        await _tokenService.saveToken(clientLoginResponse.accessToken);

        ClientModel client = ClientModel.fromJson(json.decode(response.body));

        clientController.setClient(client);
      } else {
        customSnackbar.showErrorSnackbar(
          'Erro ao fazer login',
          'Usuário ou senha incorretos.',
        );
        isLoggedIn.value = false;
      }
    } catch (e) {
      print(e);

      isLoggedIn.value = false;
    }
  }

  void logout() {
    isLoggedIn.value = false;
  }
}
