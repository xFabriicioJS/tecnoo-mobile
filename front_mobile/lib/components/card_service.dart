import 'package:flutter/material.dart';

// stores ExpansionPanel state information
class CardInfo {
  String headerValue;
  String expandedValue;
  bool isExpanded;

  CardInfo({
    required this.headerValue,
    required this.expandedValue,
    this.isExpanded = false,
  });
}

// generates random number of service cards
List<CardInfo> generateItems(int numberOfItems) {
  return List<CardInfo>.generate(numberOfItems, (int index) {
    return CardInfo(
      headerValue: 'Panel $index',
      expandedValue: 'Data de abertura $index',
    );
  });
}

class CardService extends StatefulWidget {
  const CardService({super.key});

  @override
  State<CardService> createState() => _CardServiceState();
}

class _CardServiceState extends State<CardService> {
  final List<CardInfo> _data = generateItems(8);

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
        children: _data.map<ExpansionPanel>((CardInfo item) {
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
              );
            },
            body: ListTile(
              title: Text(item.expandedValue),
            ),
            isExpanded: item.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}
