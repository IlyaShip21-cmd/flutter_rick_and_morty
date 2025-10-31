import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.blueGrey,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
