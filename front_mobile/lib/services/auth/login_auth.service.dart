import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginAuthService extends GetxController {
  var isLoggedIn = false.obs;

  void showLoginErrorSnackbar() {
    Get.snackbar(
      'Erro de login',
      'As credenciais de login são inválidas. Tente novamente.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  Future<void> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/api/auth/client'),
        body: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Se a resposta tiver status 200, o login foi bem-sucedido.
        isLoggedIn.value = true;
      } else {
        // Caso contrário, o login falhou. Exiba o Snackbar.
        showLoginErrorSnackbar();
        isLoggedIn.value = false;
      }
    } catch (e) {
      // Trate qualquer erro de conexão aqui.
      print('Erro: $e');
      showLoginErrorSnackbar();
      isLoggedIn.value = false;
    }
  }

  void logout() {
    isLoggedIn.value = false;
  }
}
