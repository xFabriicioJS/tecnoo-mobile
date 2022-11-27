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

class CardDescarte extends StatefulWidget {
  const CardDescarte({super.key});

  @override
  State<CardDescarte> createState() => CardDescarteState();
}

class CardDescarteState extends State<CardDescarte> {
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
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.construction_rounded),
              ),
              title: Text(
                item.headerValue,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {},
              subtitle: const Text('Data de abertura do descarte'),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle: const Text('Descrição do descarte'),
              trailing: const Icon(Icons.more_rounded),
              onTap: () {
                print('Navegando para visualizar-descarte');
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
