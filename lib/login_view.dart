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
      appBar: AppBar(
        centerTitle: true,
        title: Row(children: const [
          Icon(Icons.visibility_off),
          Text("Secret Box"),
        ]),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                "Open your Box",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Box Name",
                      hintText: "Input your box name.. ex: box-patrick"),
                  controller: boxNameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Password",
                      hintText: "Input your password.."),
                  controller: passwordController,
                ),
              ),
              MaterialButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {},
                child: const Text("Open Box"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
