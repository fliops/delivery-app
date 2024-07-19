import 'package:flutter/material.dart';

class IconHome extends StatelessWidget {
  const IconHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "home");
        },
        child: Image.asset(
          "assets/ho.png",
          height: 30,
          width: 30,
        ),
      ),
    );
  }
}
