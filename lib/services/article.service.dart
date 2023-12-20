import 'dart:convert';

import 'package:flutter_http/models/article.model.dart';
import 'package:http/http.dart' as http;



// 3 - Créer le service


class ArticleService {
// url pour chrome
  static String articleUrl = "http://localhost:8000/articles.json";

// url pour emulateur
 //static String articleUrl = "http://192.168.1.225:8000/articles.json";

// Méthode async promesse await
// Future et Stream sont des promesses
// Future est utilisé avec des evt asynchrones
// on ajoute "?" dnas Future<ProducList?> pour le cas ou le return est null

//Methode est en static ce qui permet de l'appeler dans la classe
  static Future<ArticleList?> getArticles() async {
    try {
      final response = await http
          .get(Uri.parse(articleUrl), headers : {"Accept": "application/json"});

      if (response.statusCode == 200) {
        //succès de l'appli call
        if (response.body.isNotEmpty) {
          final jsonResponse = json.decode(response.body);

          // 1.ArticleList.fromJson(jsonResponse) va lancer le factory dans le model, qui lui meme lance une autre factory
         // final ArticleList articles = ArticleList.fromJson(jsonResponse);
         final ArticleList articles = ArticleList.fromJson(jsonResponse['articles']);

          if (articles.articles.isNotEmpty) {
            return articles;
          } else {
            return null;
          }
        } else {
          return null;
        }
      } else {
        throw Exception("Impossible de charger les articles1");
      }
    } catch (e) {
      print(e.toString());
      throw Exception("Impossible de charger les articles2");
    }
  }
}
