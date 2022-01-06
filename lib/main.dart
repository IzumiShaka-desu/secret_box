import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secret_box/home_view.dart';
import 'package:secret_box/login_view.dart';
import 'package:secret_box/provider/main_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => MainProvider())],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          primarySwatch: Colors.pink,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // initialRoute: LoginView.routeName,
        onGenerateRoute: (route) {
          switch (route.name) {
            case HomeView.routeName:
              return CupertinoPageRoute(builder: (ctx) => const HomeView());
            default:
              return CupertinoPageRoute(builder: (ctx) => const LoginView());
          }
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
