import 'package:delivery/screen/help.dart';
import 'package:delivery/screen/homepage.dart';
import 'package:delivery/screen/login.dart';
import 'package:delivery/screen/map.dart';
import 'package:delivery/screen/order.dart';
import 'package:delivery/screen/trask.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(const delivery());
}

class delivery extends StatelessWidget {
  const delivery({Key? key}) : super(key: key);
  final arg = String;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: sharedPref.getString("id") == null ? "login" : "home",
      routes: {
        "login": (context) => const LoginPage(),
        "home": (context) => HomePage(),
        "orderdlv": (context) => OrderDlv(),
        "help": (context) => const Help(),
        "map": (context) => const Maps(),
        "track": (context) => const Track(),
      },
    );
  }
}
