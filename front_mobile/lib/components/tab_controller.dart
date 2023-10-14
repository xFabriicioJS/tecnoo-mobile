import 'package:flutter/material.dart';
import 'package:front_mobile/pages/chamados/chamados_page.dart';
import 'package:front_mobile/pages/descartes/descartes_page.dart';
import 'package:front_mobile/pages/account/my_account_page.dart';

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
          backgroundColor: const Color.fromARGB(255, 73, 4, 85),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.construction_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.recycling_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.account_circle_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          title: const Center(
            child: Text(
              'Tecnoo',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
