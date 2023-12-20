import 'package:flutter/material.dart';
import 'package:flutter_http/models/product.model.dart';
import 'package:flutter_http/services/product.service.dart';



// 5 - Créer le composant stateful permettant l'utilisation des models 

class ProductLister extends StatefulWidget {
  const ProductLister({super.key});

  @override
  State<ProductLister> createState() => _ProductListerState();
}

class _ProductListerState extends State<ProductLister> {

//Données dont on a besoin
late Future<ProductList?> products;

// Methode init()
@override
void initState(){
  super.initState();
  loadProducts();
}

void loadProducts(){
  setState((){
    // on peut appeler notre ProductService et notre methode car ils sont en static dans la classe donc accessible ici
  products = ProductService.getProducts();
  });
}



  @override
  Widget build(BuildContext context) {

    // Widget FutureBuilder => pour afficher des données
    return FutureBuilder(
      future: products, 
      builder: (context, snapshot){
        // les données sont arrivées sans erreur
        if(snapshot.hasData){
          List<Product> products = snapshot.data!.products;
          return ListView.builder(
            itemCount: snapshot.data!.products.length,
            itemBuilder: (context, index){
              Product product = products[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  // You can customize Card properties here
                  child: ListTile(
                    leading: Image.asset(
                      "web/assets/img/${product.image}",
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.description),
                        Text('\$${product.price}'),
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