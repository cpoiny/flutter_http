import 'dart:convert';

import 'package:flutter_http/models/student.model.dart';
import 'package:http/http.dart' as http;



// 3 - Créer le service


class StudentService {
// url pour chrome
  static String studentUrl = "http://localhost:8000/student.json";

// url pour emulateur
 //static String studentUrl = "http://192.168.1.225:8000/products.json";

// Méthode async promesse await
// Future et Stream sont des promesses
// Future est utilisé avec des evt asynchrones
// on ajoute "?" dnas Future<ProducList?> pour le cas ou le return est null

//Methode est en static ce qui permet de l'appeler dans la classe
  static Future<Student?> getStudent() async {
    try {
      final response = await http
          .get(Uri.parse(studentUrl), headers : {"Accept": "application/json"});

      if (response.statusCode == 200) {
        //succès de l'appli call
        if (response.body.isNotEmpty) {
          final jsonResponse = json.decode(response.body);

          // 1.ProductList.fromJson(jsonResponse) va lancer le factory dans le model, qui lui meme lance une autre factory
          final Student student = Student.fromJson(jsonResponse);

          return student;
        } else {
          return null;
        }
      } else {
        throw Exception("Impossible de récuperer les students1");
      }
    } catch (e) {
      print(e.toString());
      throw Exception("Impossible de récuperer les students2");
    }
  }
}
