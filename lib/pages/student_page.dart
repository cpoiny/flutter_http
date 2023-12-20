import 'package:flutter/material.dart';
import 'package:flutter_http/components/studentLister.dart';
import 'package:flutter_http/components/studentsLister.dart';


class StudentPage extends StatelessWidget {
   StudentPage({
  super.key,
  required this.all,
  });

  bool all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,  
        title: Text(all ? "L' Etudiant": "Nos Etudiants"),
      ),
      body: all == true ? const StudentLister() : const StudentsLister(),
    );
  }
}