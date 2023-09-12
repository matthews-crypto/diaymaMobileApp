import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class VendeurPage extends StatefulWidget {
  @override
  _VendeurPageState createState() => _VendeurPageState();
}

class _VendeurPageState extends State<VendeurPage> {
  // Une liste de produits à vendre
// Le code de l'interface Flutter en Dart


  // L'URL de base de l'API
  final String baseUrl = "http://192.168.0.86:8080/api";

  // La liste des produits à afficher
  List<Product> products = [];

  // Le client HTTP pour communiquer avec l'API
  http.Client client = http.Client();

  // La méthode qui récupère tous les produits depuis l'API
  Future<void> getProducts() async {
    // Envoyer une requête GET à l'endpoint "/products"
    final response = await client.get(Uri.parse("$baseUrl/products"));

    // Si le code de la réponse est 200 (succès)
    if (response.statusCode == 200) {
      // Décoder le corps de la réponse au format JSON
      final data = json.decode(response.body);

      // Créer un nouveau slice de produits
      List<Product> newProducts = [];

      // Parcourir les éléments du JSON et les ajouter au slice
      for (Map<String, dynamic> element in data) {
        newProducts.add(Product.fromJson(element));
      }

      // Mettre à jour l'état de la liste des produits avec le nouveau slice
      setState(() {
        products = newProducts;
      });
    } else {
      // Sinon, afficher une erreur
      print("Failed to get products");
    }
  }

  // La méthode qui ajoute un produit dans l'API
  Future<void> addProduct(Product product) async {
    // Envoyer une requête POST à l'endpoint "/products" avec le produit au format JSON
    final response = await client.post(
      Uri.parse("$baseUrl/products"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(product),
    );

    // Si le code de la réponse est 201 (création)
    if (response.statusCode == 201) {
      // Décoder le corps de la réponse au format JSON
      final data = json.decode(response.body);

      // Récupérer l'identifiant du produit créé
      final id = data["_id"];

      // Mettre à jour l'état de la liste des produits en ajoutant le nouveau produit avec son identifiant
      setState(() {
        products.add(product.copyWith(id: id));
      });
    } else {
      // Sinon, afficher une erreur
      print("Failed to add product");
    }
  }

  // La méthode qui modifie un produit dans l'API
  Future<void> updateProduct(Product product) async {
    // Envoyer une requête PUT à l'endpoint "/products/:name" avec le produit au format JSON
    final response = await client.put(
      Uri.parse("$baseUrl/products/${product.name}"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(product),
    );

    // Si le code de la réponse est 200 (succès)
    if (response.statusCode == 200) {
      // Décoder le corps de la réponse au format JSON
      final data = json.decode(response.body);

      // Récupérer le nombre de documents modifié
      final modifiedCount = data["modified_count"];

      // Mettre à jour l'état de la liste des produits en remplaçant le produit modifié
      setState(() {
        products[products.indexWhere((p) => p.name == product.name)] = product;
      });
    } else {
      // Sinon, afficher une erreur
      print("Failed to update product");
    }
  }

  // La méthode qui supprime un produit dans l'API
  Future<void> deleteProduct(Product product) async {
    // Envoyer une requête DELETE à l'endpoint "/products/:name"
    final response = await client.delete(Uri.parse("$baseUrl/products/${product.name}"));

    // Si le code de la réponse est 200 (succès)
    if (response.statusCode == 200) {
      // Décoder le corps de la réponse au format JSON
      final data = json.decode(response.body);

      // Récupérer le nombre de documents supprimés
      final deletedCount = data["deleted_count"];

      // Mettre à jour l'état de la liste des produits en supprimant le produit
      setState(() {
        products.removeWhere((p) => p.name == product.name);
      });
    } else {
      // Sinon, afficher une erreur
      print("Failed to delete product");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interface Flutter'),
        backgroundColor: Colors.blue,
      ),
      // Le corps de la page
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          // Le widget qui représente un produit
          return ListTile(
            leading: Image.asset('assets/${products[index].image}'),
            title: Text(products[index].name),
            subtitle: Text('${products[index].price} euros'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Ici, vous pouvez ajouter la logique pour modifier le produit
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Ici, vous pouvez ajouter la logique pour supprimer le produit
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Une classe qui représente un produit
class Product {
  final String id;
  final String name;
  final int price;
  final String image;

  Product({this.id = "", required this.name, required this.price, required this.image});

  // Une méthode pour créer un objet Product à partir d'un JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["_id"],
      name: json["name"],
      price: json["price"],
      image: json["image"],
    );
  }

  // Une méthode pour copier un objet Product avec un nouvel identifiant
  Product copyWith({String? id}) {
    return Product(
      id: id ?? this.id,
      name: this.name,
      price: this.price,
      image: this.image,
    );
  }
}

      
