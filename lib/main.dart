import 'package:flutter/material.dart';
import 'package:gif_ted/src/screens/gif_detail_screen.dart';
import 'package:gif_ted/src/screens/settings_screen.dart';
import 'package:gif_ted/src/screens/welcome_screen.dart';
import 'package:gif_ted/src/screens/login_screen.dart';
import 'package:gif_ted/src/screens/gif_list_screen.dart';

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
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        GifListScreen.id: (context) => GifListScreen(),
        GifDetailScreen.id: (context) => const GifDetailScreen(),
        SettingsScreen.id: (context) => const SettingsScreen(),
      },
    );
  }
}
