import 'package:flutter/material.dart';
import 'package:front_mobile/pages/chamados_page.dart';
import 'package:front_mobile/pages/descartes_page.dart';
import 'package:front_mobile/pages/minha_conta_page.dart';

class TabControllerWidget extends StatelessWidget {
  const TabControllerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          bottom: TabBar(
            indicator: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(50),
            ),
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.construction_rounded,
                  size: 30,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.recycling_rounded,
                  size: 30,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.account_circle_rounded,
                  size: 30,
                ),
              ),
            ],
          ),
          title: const Center(child: Text('Tecnoo')),
        ),
        body: const TabBarView(
          children: [
            ChamadosPage(),
            DescartesPage(),
            MinhaContaPage(),
          ],
        ),
      ),
    );
  }
}
