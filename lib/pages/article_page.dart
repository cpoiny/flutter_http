import 'package:flutter/material.dart';
import 'package:flutter_http/components/articleLister.dart';
import 'package:flutter_http/models/article.model.dart';



// 4 - Créer la page

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,  
        title: const Text("Nos articles"),
      ),
      body: const ArticleLister(),
    );
  }
}