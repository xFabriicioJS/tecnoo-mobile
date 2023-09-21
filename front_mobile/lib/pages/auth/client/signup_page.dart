import 'package:flutter/material.dart';
import 'package:front_mobile/pages/auth/client/signup/pf/pfsignup_page.dart';
import 'package:front_mobile/pages/auth/client/signup/pj/pjsignup_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({
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
                child: Text(
                  "PESSOA FÍSICA",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "PESSOA JURÍDICA",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          title: const Text(
            'Cadastro',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        body: const TabBarView(
          children: [
            PFSignupPage(),
            PJSignupPage(),
          ],
        ),
      ),
    );
  }
}
