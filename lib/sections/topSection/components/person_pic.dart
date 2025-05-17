import 'package:flutter/material.dart';

class PersonPic extends StatelessWidget {
  const PersonPic({
    Key? key,
  }) : super(key: key);
// Poner imagen de una persona en la presentación
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 639, maxHeight: 860),
      child: Image.asset("assets/images/persona.png"),
    );
  }
}