import 'package:flutter/material.dart';

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class ChamadoCard extends StatefulWidget {
  const ChamadoCard({super.key});

  @override
  State<ChamadoCard> createState() => _ChamadoCardState();
}

class _ChamadoCardState extends State<ChamadoCard> {
  final List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width * .85,
          child: _buildPanel(),
        ),
      );
    });
  }

  Widget _buildPanel() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data[index].isExpanded = !isExpanded;
          });
        },
        children: _data.map<ExpansionPanel>((Item item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                leading: const CircleAvatar(
                  child: Icon(Icons.construction_rounded),
                ),
                title: Text(
                  item.headerValue,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                onTap: () {},
                subtitle: const Text('Data de abertura do chamado'),
              );
            },
            body: ListTile(
                title: Text(item.expandedValue),
                subtitle: const Text('Descri????o do chamado'),
                trailing: const Icon(Icons.more_rounded),
                onTap: () {
                  print('Navegando para visualizar-chamado');
                }),
            isExpanded: item.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}
