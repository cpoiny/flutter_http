import 'package:flutter/material.dart';
import 'package:flutter_http/components/studentLister.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,  
        title: const Text("Un étudiant"),
      ),
      body: const StudentLister(),
    );
  }
}