import 'package:flutter/material.dart';
import 'package:gif_ted/src/styles/constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    this.title = "",
    this.colour = Colors.grey,
    required this.onPressed,
  }) : super(key: key);

  final Color colour;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            onPressed();
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: loginButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
