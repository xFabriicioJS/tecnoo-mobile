import 'package:brasil_datetime/brasil_datetime.dart';
import 'package:flutter/material.dart';
import 'package:front_mobile/services/models/ticket/ticket.dart';

class ChamadoDetailsPage extends StatelessWidget {
  final Ticket ticket;

  const ChamadoDetailsPage({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    print(ticket.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detalhes do chamado",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Image(
                image: Image.asset('assets/images/ticket-service.png').image,
                width: 300,
                height: 300,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Solicitação criada em ${ticket.dataAbertura.diaMesAnoHoraMinuto()}',
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Protocolo: ',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: ticket.protocolo,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              TicketInfo(ticket: ticket),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ListView.separated(
                    itemBuilder: ((context, index) => const ListTile(
                          leading: CircleAvatar(child: Text('A')),
                          title: Text('Headline'),
                          subtitle: Text('Supporting text'),
                          trailing: Icon(Icons.favorite_rounded),
                        )),
                    separatorBuilder: (context, index) => const Divider(
                          height: 1,
                        ),
                    itemCount: ticket.historicos?.length ?? 0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TicketInfo extends StatelessWidget {
  const TicketInfo({
    super.key,
    required this.ticket,
  });

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ticket.titulo!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DESCRIÇÃO DO CHAMADO',
                    style: TextStyle(
                      fontSize: 12,
                      height: 3,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    ticket.descricao!,
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(14),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "PRAZO DE ATENDIMENTO",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        ticket.dataLimite?.diaMesAnoAbrev() ??
                            "Não foi possível definir o prazo.",
                      ),
                    ],
                  ),
                ),
                const Positioned(
                    right: 10,
                    top: 30,
                    child: Icon(
                      Icons.timer_rounded,
                      size: 30,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
