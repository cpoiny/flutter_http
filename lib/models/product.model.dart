
// 2 - Créer le model en allant du plus impriqué au moins imbriqué (ex: Product puis ProductList)

class Product
{

  //Constructeur
  Product(
    this.name,
    this.description,
    this.price,
    this.image,
);

// Propriétés de la classe qui seront initialisés par le déclenchement de la méthode factory
  final String name;
  final String description;
  final int price;
  final String image;

// On utilise factory pour créer une map de string dynamic qu'on appelle json
// On vient de fabriquer des objets de type Product

// 3. Declenche le factory de Product
// Méthode factory utilisée pour implémenter des logiques de création d'objets avancées
// telles que la réutilisation d'instance existante, la création d'instance de sous classes
// en fonction de certains critères etc....
// Elle offre une fléxibilité supplémentaire par rapport au constructeur classique (elle est au dessus du constructeur classique)

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['name'],
      json['description'],
      json['price'],
      json['image'],
    );
  }

  //Getter
  String get getName => name;
  String get getDescription => description;
  int get getPrice => price;
  String get getImage => image;
}


// La classe la moins imbriquée

class ProductList{

  // constructeur
  ProductList({required this.products});

  final List<Product> products;

  factory ProductList.fromJson(List<dynamic> parseJson) {
    List <Product> products = <Product>[];
    // 2. Appel Product en fromJson
    products = parseJson.map((p) => Product.fromJson(p)).toList();
    return ProductList(products : products);
  }
}