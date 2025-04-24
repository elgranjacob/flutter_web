import 'package:flutter/material.dart';

class Feedback {
  final String name, review, userPic;
  final int id;
  final Color color;

  Feedback({required this.name, required this.review, required this.userPic, required this.id, required this.color});
}

List<Feedback> feedback = [
  Feedback(name: 'Ronald Thompson', review: review, userPic: "", id: 1, color: Color(0xFFFFF3DD)),
  Feedback(name: 'Ronald Thompson', review: review, userPic: "", id: 2, color: Color(0xFFD9FFFC)),
  Feedback(name: 'Ronald Thompson', review: review, userPic: "", id: 3, color: Color(0xFFFFE0E0))
];

String review = "haoihsinhoihoihaoiasi";