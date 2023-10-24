import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:front_mobile/components/error/snackbars.dart';
import 'package:front_mobile/services/models/ticket/ticket.dart';
import 'package:http/http.dart' as http;

class TicketService {
  CustomSnackbars customSnackbar = CustomSnackbars();

  Future<List<Ticket>> getAllTickets(String token) async {
    try {
      final response = await http.get(
        Uri.parse('${dotenv.env['API_URL_MOBILE']}/chamados'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        List<Ticket> tickets = [];
        List<dynamic> responseJson = json.decode(response.body);

        for (var element in responseJson) {
          tickets.add(Ticket.fromJSON(element));
          // print(tickets);
        }

        return tickets;
      } else {
        customSnackbar.showErrorSnackbar(
          'Ocorreu um erro ao buscar os chamados',
          'Erro ao buscar chamados.',
        );
      }
    } catch (e) {
      print(e);
    }

    return [];
  }
}
