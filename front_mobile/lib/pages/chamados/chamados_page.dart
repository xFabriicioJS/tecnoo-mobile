import 'package:brasil_datetime/brasil_datetime.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:front_mobile/components/card_service.dart';
import 'package:front_mobile/components/elements/floating_add_button.dart';
import 'package:front_mobile/components/help_about.dart';
import 'package:front_mobile/components/services_count_widget.dart';
import 'package:front_mobile/pages/chamados/addchamado_page.dart';
import 'package:front_mobile/pages/chamados/components/custom_filter_chip.dart';
import 'package:front_mobile/services/models/ticket/ticket.dart';
import 'package:front_mobile/services/tickets/ticket_service.dart';
import 'package:front_mobile/services/token/token_service.dart';

class ChamadosPage extends StatefulWidget {
  const ChamadosPage({super.key});

  @override
  State<ChamadosPage> createState() => _ChamadosPageState();
}

class _ChamadosPageState extends State<ChamadosPage> {
  final TicketService ticketService = TicketService();

  List<Ticket> tickets = [];
  Future<String?> token = TokenService().loadToken();

  @override
  void initState() {
    super.initState();

    token.then((value) => {
          if (value != null)
            {
              ticketService.getAllTickets(value).then(
                    (response) => setState(() {
                      tickets = response;
                    }),
                  ),
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingAddButton(
        page: AddChamadoPage(),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Meus chamados',
                    style: TextStyle(
                      letterSpacing: 0.01,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    DateTime.now().diaSemanaMesExt(),
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Pesquisar',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomFilterChip(
                title: "Abertos",
              ),
              CustomFilterChip(
                title: "Finalizados",
              ),
            ],
          ),
          CardService(
            cards: tickets,
          ),
        ]),
      ),
    );
  }
}
