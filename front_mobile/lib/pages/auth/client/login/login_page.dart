import 'package:flutter/material.dart';
import 'package:front_mobile/pages/auth/client/login/components/login_form_field.dart';
import 'package:front_mobile/pages/auth/client/login/components/text_divider.dart';
import 'package:front_mobile/services/auth/login_auth.service.dart';
import 'package:get/get.dart';

class ClientLoginPage extends StatefulWidget {
  const ClientLoginPage({super.key});

  @override
  State<ClientLoginPage> createState() => _ClientLoginPageState();
}

class _ClientLoginPageState extends State<ClientLoginPage> {
  String email = '';
  String password = '';

  bool isLoading = false;

  LoginAuthService authService = LoginAuthService();

  void login() async {
    setState(() {
      isLoading = true;
    });

    await authService.login(email, password);

    mounted ? setState(() => isLoading = false) : null;
  }

  @override
  void initState() {
    super.initState();
    authService.isLoggedIn.listen((value) {
      if (value) {
        Navigator.popUntil(context, (route) => route.isFirst);

        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 73, 4, 85),
                Color.fromARGB(255, 121, 9, 107),
              ],
            ),
          ),
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Image.asset(
                              'assets/images/logonova.png',
                              scale: 2.0,
                            ),
                          ),
                          const Text(
                            'Bem vindo de volta!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Text(
                            'Faça seu login.',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            LoginFormField(
                              hintText: "Email",
                              prefixIcon: Icons.email_outlined,
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                              },
                            ),
                            LoginFormField(
                                hintText: "Senha",
                                prefixIcon: Icons.key_rounded,
                                obscureText: true,
                                onChanged: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                }),
                            ElevatedButton(
                              onPressed: () {
                                login();
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                padding: const EdgeInsets.all(30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Continuar",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    child: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextDivider(
                              title: 'Ou',
                              color: Colors.white.withAlpha(180),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/signup');
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                minimumSize: const Size(double.infinity, 50),
                                padding: const EdgeInsets.all(30),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                backgroundColor: Colors.white.withOpacity(0.3),
                              ),
                              child: const Text(
                                "Criar conta",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Center(
                  child: Visibility(
                    visible: isLoading,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: SafeArea(
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/welcome-screen');
                      },
                      icon: const Icon(Icons.arrow_back_ios_rounded),
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
