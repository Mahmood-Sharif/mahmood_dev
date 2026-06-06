import 'package:flutter/material.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 500,
      child: Center(
        child: Text(
          'Tech Stack Section',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}