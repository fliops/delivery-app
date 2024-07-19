import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  TextTitle({
    super.key,
    required this.text, required this.color,
  });
  String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 30,
          fontFamily: 'Akshar',
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      ),
    );
  }
}
