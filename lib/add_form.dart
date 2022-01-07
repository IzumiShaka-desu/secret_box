import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:secret_box/model/note.dart';
import 'package:secret_box/provider/main_provider.dart';

class AddForm extends StatefulWidget {
  const AddForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  late final TextEditingController nameController;
  late final TextEditingController contentController;
  @override
  void initState() {
    nameController = TextEditingController();
    contentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 5,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              'Add Notes',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: "Note Name",
                hintText: "Input your Note Name.. ex: patrick-secret",
              ),
              controller: nameController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: "content",
                hintText: "Input your note content.. ex: this is a secret",
              ),
              controller: contentController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
            child: MaterialButton(
              textColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Icon(Icons.add), Text(" add Notes")],
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () async {
                if (contentController.text.isNotEmpty &&
                    nameController.text.isNotEmpty) {
                  Note newNote = Note(
                    note: contentController.text,
                    noteName: nameController.text,
                  );

                  context.read<MainProvider>().addNotes(newNote);
                  Navigator.of(context).pop();
                } else {
                  debugPrint("Aasdd");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("all fields is required!"),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height - 125,
                          right: 20,
                          left: 20),
                    ),
                  );
                }
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          ),
        ],
      ),
    );
  }
}
