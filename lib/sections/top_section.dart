import 'package:flutter/material.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 900,
        minHeight: 700
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("")),
      ),
      child: SizedBox(
        width: 1200,
        child: Column(
          children: [
            Image.asset("")
            ],
        ),
      ),
    );
  }
}