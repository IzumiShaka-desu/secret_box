import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:secret_box/datasource/hive_datasource.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);
  static const String routeName = "/test";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("test"),
      ),
      body: FutureBuilder(
        future: testData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text("${snapshot.data}");
          }
          return const Text("no data");
        },
      ),
    );
  }

  Future<List> testData() async {
    // i2qa5ijwzlvbjzjpttl+ag==
    String name = HiveDataSource().box?.name ?? "jmzn4ajkw8bvieyvnvoz6g==";
    var res = [];
    debugPrint("box encrypted name : " + name);
    final box = await Hive.openBox(name);
    // box.keys
    for (var key in box.keys) {
      res.add(box.get(key));
    }
    return res;
  }
}
