import 'package:brasil_datetime/brasil_datetime.dart';
import 'package:flutter/material.dart';
import 'package:front_mobile/components/custom_card.dart';
import 'package:front_mobile/components/elements/add_button.dart';
import 'package:front_mobile/pages/chamados/components/custom_filter_chip.dart';
import 'package:front_mobile/services/models/ticket/ticket.dart';
import 'package:front_mobile/services/tickets/ticket_service.dart';
import 'package:front_mobile/services/token/token_service.dart';

class ChamadosPage extends StatelessWidget {
  const ChamadosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AddButton(
        backgroundColor: Theme.of(context).primaryColor,
        textColor: Colors.white,
        text: "Adicionar chamado",
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () async {
              await CardsList()._fetchData();
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                              fontWeight: FontWeight.w400,
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
                  const Row(
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
                  CardsList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardsList extends StatelessWidget {
  CardsList({super.key});

  final TicketService ticketService = TicketService();

  Future<List<Ticket>?> _fetchData() async {
    await Future.delayed(const Duration(milliseconds: 1500));

    final String? token = await TokenService().loadToken();
    final List<Ticket>? tickets = await ticketService.getAllTickets(token!);
    return tickets;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Ticket>?>(
      future: _fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.data == null) {
          return Column(children: [
            Image(
              image: Image.asset('assets/images/ErrorImage.png').image,
              width: 250,
              height: 250,
            ),
            Text(
              'Ocorreu um erro ao buscar os chamados.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black.withOpacity(0.4),
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  _fetchData();
                },
                child: const Text('Tentar novamente'),
              ),
            )
          ]);
        }

        if (snapshot.hasData && snapshot.data!.isEmpty) {
          return Center(
            child: Image(
              image: Image.asset('assets/images/NotFound.png').image,
            ),
          );
        }

        return Container(
          padding:
              const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 80),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              snapshot.data!
                  .sort((a, b) => b.dataAbertura.compareTo(a.dataAbertura));

              print(snapshot.data);

              return CustomCard(
                infoCard: snapshot.data![index],
                icon: Icons.construction_rounded,
                iconColor: Colors.white,
                backgroundIconColor: Theme.of(context).primaryColor,
              );
            },
          ),
        );
      },
    );
  }
}
