import 'package:flutter/material.dart';
import 'src/screens/welcome_screen.dart';
import 'src/screens/login_screen.dart';
import 'src/screens/gif_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gif Ted',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        GifListScreen.id: (context) => GifListScreen(),
      },
    );
  }
}
