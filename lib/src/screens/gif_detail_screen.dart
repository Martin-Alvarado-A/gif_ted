import 'package:flutter/material.dart';

class GifDetailScreen extends StatelessWidget {
  const GifDetailScreen({Key? key}) : super(key: key);
  static const String id = 'gif_detail_screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Placeholder(),
      ),
    );
  }
}
