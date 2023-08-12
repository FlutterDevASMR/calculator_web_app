import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.text});

  final String text;

  Color _getButtonColor() {
    Color color = Colors.white;

    if (text == 'C') {
      color = Colors.red;
    } else if (text == 'DEL') {
      color = Colors.green;
    } else if (text == '%' ||
        text == '/' ||
        text == 'x' ||
        text == '-' ||
        text == '=' ||
        text == '+') {
      color = Colors.purple;
    } else {
      color = Colors.white;
    }

    return color;
  }

  Color _getTextColor() {
    Color color = Colors.black;

    if (text == 'C') {
      color = Colors.white;
    } else if (text == 'DEL') {
      color = Colors.white;
    } else if (text == '%' ||
        text == '/' ||
        text == 'x' ||
        text == '-' ||
        text == '=' ||
        text == '+') {
      color = Colors.white;
    } else {
      color = Colors.black;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 25,
            color: _getTextColor(),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: _getButtonColor(),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
