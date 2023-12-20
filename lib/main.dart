import 'package:flutter/material.dart';
import 'package:flutter_http/models/article.model.dart';
import 'package:flutter_http/pages/article_page.dart';
import 'package:flutter_http/pages/product_page.dart';

void main() {
  runApp(const MyApp());
}

// Lancement du serveur http de dev:
// > cd jsonWebServer
// > http-server . --cors -p 8000


// Le workflow pour traiter les données en provenance d'une API externe

// 1 - Analyser la structure du JSON reçu (objet, tableau d'objet ?)
// 2 - Créer le model en allant du plus impriqué au moins imbriqué (ex: Product puis ProductList)
// 3 - Créer le service
// 4 - Créer la page
// 5 - Créer le composant stateful permettant l'utilisation des models 




// analyse de products.json
// on a un tableau d'objet json
// ce qui se traduit en typage List<Map<String, dynamic>>
// on devra modeliser au moins  deux classes
// une classe contenant l'objet et une classe de la liste d'objet



// on commence toujours par le plus imbriqué vers le moins imbriqué






class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Page d'accueil"),
      ),
      body: Column(
        children: <Widget>[
         ElevatedButton(
          onPressed:() {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductPage()),
                );
          },
          style: const ButtonStyle(
            
          ),
          child:const Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Products"),
              Icon(
                Icons.chevron_right,
                ),
            ],
          ),
        ),


        ElevatedButton(
          onPressed:() {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ArticlePage()),
                );
          },
          style: const ButtonStyle(
            
          ),
          child:const Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Articles"),
              Icon(
                Icons.chevron_right,
                ),
            ],
          ),
        ),

      ],
    ),
    );
  }
}


