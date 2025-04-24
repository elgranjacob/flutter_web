import 'package:flutter/material.dart';

class Service {
  final int id;
  final String title, image;
  final Color color;

  Service({required this.id, required this.title, required this.image, required this.color});
}

List<Service> services = [
  Service(id: 1, title: "Graphics Design", image: "", color: Color(0xFFD9FFFC)),
  Service(id: 2, title: "Web Design", image: "", color: Color(0xFFE4FFC7)),
  Service(id: 3, title: "UI Design", image: "", color: Color(0xFFFFF3DD)),
  Service(id: 4, title: "Interaction Design", image: "", color: Color(0xFFFFE0E0))
];