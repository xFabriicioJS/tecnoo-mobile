import 'package:flutter/material.dart';
import 'package:front_mobile/pages/chamados/chamados_page.dart';
import 'package:front_mobile/pages/descartes/descartes_page.dart';
import 'package:front_mobile/pages/account/my_account_page.dart';
import 'package:front_mobile/services/auth/login_auth.service.dart';
import 'package:front_mobile/services/token/token_service.dart';

class TabControllerWidget extends StatefulWidget {
  const TabControllerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<TabControllerWidget> createState() => _TabControllerWidgetState();
}

class _TabControllerWidgetState extends State<TabControllerWidget> {
  LoginAuthService authService = LoginAuthService();
  TokenService tokenService = TokenService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(authService.isLoggedIn.value);

    loadToken().then((value) => print(value));
  }

  Future<String?> loadToken() async {
    return await tokenService.loadToken();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
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
