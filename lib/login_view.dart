import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:secret_box/home_view.dart';
import 'package:secret_box/provider/main_provider.dart';

import 'test_view.dart';

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
  void dispose() {
    boxNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prov = context.read<MainProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(TestView.routeName);
          },
          child: Row(children: const [
            Icon(Icons.visibility_off),
            Text("Secret Box"),
          ]),
        ),
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
                onPressed: () async {
                  if (boxNameController.text.isEmpty &&
                      passwordController.text.length < 8) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            "please fill all fields and password length greater than 7"),
                      ),
                    );
                  } else {
                    bool isCanOpen = await prov.openBox(
                      boxNameController.text,
                      passwordController.text,
                    );
                    if (isCanOpen) {
                      prov.loadNotes();
                      Navigator.pushReplacementNamed(
                          context, HomeView.routeName);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("something error please try again"),
                        ),
                      );
                    }
                  }
                },
                child: const Text("Open Box"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
