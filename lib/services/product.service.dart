import 'dart:convert';

import 'package:flutter_http/models/product.model.dart';
import 'package:http/http.dart' as http;



// 3 - Créer le service


class ProductService {
// url pour chrome
  static String productUrl = "http://localhost:8000/products.json";

// url pour emulateur
 //static String productUrl = "http://192.168.1.225:8000/products.json";

// Méthode async promesse await
// Future et Stream sont des promesses
// Future est utilisé avec des evt asynchrones
// on ajoute "?" dnas Future<ProducList?> pour le cas ou le return est null

//Methode est en static ce qui permet de l'appeler dans la classe
  static Future<ProductList?> getProducts() async {
    try {
      final response = await http
          .get(Uri.parse(productUrl), headers : {"Accept": "application/json"});

      if (response.statusCode == 200) {
        //succès de l'appli call
        if (response.body.isNotEmpty) {
          final jsonResponse = json.decode(response.body);

          // 1.ProductList.fromJson(jsonResponse) va lancer le factory dans le model, qui lui meme lance une autre factory
          final ProductList products = ProductList.fromJson(jsonResponse);

          if (products.products.isNotEmpty) {
            return products;
          } else {
            return null;
          }
        } else {
          return null;
        }
      } else {
        throw Exception("Impossible de charger les produits1");
      }
    } catch (e) {
      print(e.toString());
      throw Exception("Impossible de charger les produits2");
    }
  }
}
