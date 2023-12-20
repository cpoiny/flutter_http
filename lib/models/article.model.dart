
/**
 * CLASSE SOURCE
 */

class Source {

  // Constructeur
  Source(
    this.id,
    this.name
  );


// Propriétés
final int? id;
final String name;


// Méthode factory
factory
Source.fromJson(Map<String, dynamic> json){
  return Source(
    json['id'],
    json['name'],
  );
}

// Getters
int? get getId => id;
String get getName => name;

}

/**
 * CLASSE ARTICLE
 */
class Article {

// Constructeur
Article(
  this.source,
  this.author,
  this.title,
  this.description 
);

// Propriétés
final Source source;
final String author;
final String title;
final String description;

factory
Article.fromJson(Map<String, dynamic> json){
  return Article(

    // fromJson crée un objet à partir d'un json
    Source.fromJson(json['source']),
    json['author'],
    json['title'],
    json['description'],
  );
}

 //Getters
  Source get getSource => source;
  String get getAuthor => author;
  String get getTitle => title;
  String get getDescription => description;

}

/**
 * CLASSE ARTICLELIST
 */

class ArticleList{

  // constructeur
  ArticleList({required this.articles});

  // Propriétés
final List<Article> articles;


// Factory
factory
ArticleList.fromJson(List<dynamic> parseJson){
  List<Article> articles = <Article>[];

articles = parseJson.map((p)=> Article.fromJson(p)).toList();
return ArticleList(articles: articles);

}


}