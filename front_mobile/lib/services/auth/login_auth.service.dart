import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:front_mobile/controllers/client_controller.dart';
import 'package:front_mobile/services/models/client_login_response.dart';
import 'package:front_mobile/services/token/token_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginAuthService extends GetxController {
  RxBool isLoading = false.obs;

  final _tokenService = TokenService();

  Future<bool> signInClient(String email, String password) {
    try {
      isLoading.value = true;
      return http.post(
        Uri.parse('${dotenv.env['BASE_URL']}/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: <String, String>{'email': email, 'password': password},
      ).then((response) {
        if (response.statusCode == 200) {
          // TODO: Salvando token
          final clientLoginResponse =
              ClientLoginResponse.fromJSON(jsonDecode(response.body));
          _tokenService.saveToken(clientLoginResponse.token);
          Get.find<ClientController>().setClient(clientLoginResponse);

          return true;
        } else {
          return false;
        }
      });
    } catch (e) {
      return Future.error(e);
    }
  }
}
