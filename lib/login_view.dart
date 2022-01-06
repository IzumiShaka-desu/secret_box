import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  static const String routeName = "/login";

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController boxNameController;
  late final TextEditingController passwordController;
  @override
  void initState() {
    boxNameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: boxNameController,
            ),
            TextFormField(
              controller: passwordController,
            ),
            MaterialButton(
              onPressed: () {},
              child: const Text("Open Box"),
            )
          ],
        ),
      ),
    );
  }
}
