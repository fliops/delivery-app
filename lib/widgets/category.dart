import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({
    super.key, required this.color, required this.image,
  });
  final Color color;
    final String image;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      height: 160,
      decoration: ShapeDecoration(
        color: color,//Color(0xFFCBFAC3)
        image: DecorationImage(
          image: AssetImage(image), //'assets/Group 2.png'
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
