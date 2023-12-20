import 'package:flutter/material.dart';
import 'package:flutter_http/components/productLister.dart';
import 'package:flutter_http/models/product.model.dart';



// 4 - Créer la page

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,  
        title: const Text("Nos produits"),
      ),
      body: const ProductLister(),
    );
  }
}