import 'package:flutter/material.dart';
import 'package:gif_ted/cubit/gif_ted_cubit.dart';
import 'package:gif_ted/src/screens/gif_detail_screen.dart';
import 'package:gif_ted/src/screens/settings_screen.dart';
import 'package:gif_ted/src/screens/welcome_screen.dart';
import 'package:gif_ted/src/screens/login_screen.dart';
import 'package:gif_ted/src/screens/gif_list_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GifTedCubit(),
      child: MaterialApp(
        title: 'Gif Ted',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: WelcomeScreen(),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => const WelcomeScreen(),
          LoginScreen.id: (context) => BlocProvider.value(
                value: BlocProvider.of<GifTedCubit>(context),
                child: const LoginScreen(),
              ),
          GifListScreen.id: (context) => BlocProvider.value(
                value: BlocProvider.of<GifTedCubit>(context),
                child: GifListScreen(),
              ),
          GifDetailScreen.id: (context) => BlocProvider.value(
                value: BlocProvider.of<GifTedCubit>(context),
                child: const GifDetailScreen(),
              ),
          SettingsScreen.id: (context) => BlocProvider.value(
                value: BlocProvider.of<GifTedCubit>(context),
                child: const SettingsScreen(),
              ),
        },
      ),
    );
  }

  @override
  void dispose() {
    BlocProvider.of<GifTedCubit>(context).close();
    super.dispose();
  }
}
