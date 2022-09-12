import 'package:flutter/material.dart';
import './pages/login.dart';
import './pages/register.dart';
import './pages/home.dart';
import 'package:provider/provider.dart';
import './provider/cart.dart';
import './pages/checkout.dart';
import './pages/about.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({ super.key });

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {return Cart();},
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Login(),
      routes: {
        'login': (context) => const Login(),
        'register': (context) => const Register(),
        'home': (context) => const Home(),
        'checkout': (context) => const CheckOut(),
        'about': (context) => const About(),
      },
    ),
    );
  }
}