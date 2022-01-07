import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secret_box/login_view.dart';
import 'package:secret_box/provider/main_provider.dart';
import 'package:secret_box/test_view.dart';

import 'add_form.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static const String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    final notes = context.watch<MainProvider>().notes;
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(TestView.routeName);
          },
          child: Row(children: const [
            Icon(Icons.visibility_off),
            Text("Secret Box"),
          ]),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              context.read<MainProvider>().closeBox();
              Navigator.of(context).pushReplacementNamed(LoginView.routeName);
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: notes.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Center(
                  child: Text(
                    "You don't have any notes, please add something important! like you",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: notes.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final note = notes[index];
                return Card(
                  child: ListTile(
                    title: Text(note.noteName),
                    subtitle: Text(note.note),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10.0),
              ),
            ),
            backgroundColor: Colors.white,
            context: context,
            isScrollControlled: true,
            builder: (context) => const AddForm(),
          );
        },
      ),
    );
  }
}
