import 'package:flutter/material.dart';
import 'package:flutter_http/models/article.model.dart';
import 'package:flutter_http/services/article.service.dart';



// 5 - Créer le composant stateful permettant l'utilisation des models 

class ArticleLister extends StatefulWidget {
  const ArticleLister({super.key});

  @override
  State<ArticleLister> createState() => _ArticleListerState();
}

class _ArticleListerState extends State<ArticleLister> {

//Données dont on a besoin
late Future<ArticleList?> articles;

// Methode init()
@override
void initState(){
  super.initState();
  loadProducts();
}

void loadProducts(){
  setState((){
    // on peut appeler notre ProductService et notre methode car ils sont en static dans la classe donc accessible ici
  articles = ArticleService.getArticles();
  });
}



  @override
  Widget build(BuildContext context) {

    // Widget FutureBuilder => pour afficher des données
    return FutureBuilder(
      future: articles, 
      builder: (context, snapshot){
        // les données sont arrivées sans erreur
        if(snapshot.hasData){
          List<Article> articles = snapshot.data!.articles;
          return ListView.builder(
            itemCount: snapshot.data!.articles.length,
            itemBuilder: (context, index){
              Article article = articles[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  // You can customize Card properties here
                  child: ListTile(
                    title: Text("${article.title} de ${article.author} - ${article.source.name}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(article.description),
                      ],
                    ),
                    // You can handle onTap here
                    //attention si on utilise Chrome on doit mettre onTapDown() dans un gestureDetector pour encadrer ma card car Chrome ne gere pas onTap
                    onTap: () {
                      // Add your onTap logic
                    },
                  ),
                ),
              );
            }
          );



          // les données sont arrivées avec des erreurs
        } else if (snapshot.hasError){
          return Text("error: ${snapshot.error}");
        }

        // Les données ne sont pas encore arrivées et il n'y a pas d'erreurs
        return const Expanded(
          child: Center (
            // affichage du spinner
            child: CircularProgressIndicator(),
          ),
        );
      });
  }
}