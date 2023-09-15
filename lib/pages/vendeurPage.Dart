import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class VendeurPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dallal akk diamm cie dIAyma'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0), // Ajout du padding au ListView
        children: [
          Text(
            'Yallah naa ndiayee bii barkel',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vos Produits',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductStat(label: 'En Stock', value: '24'),
                      ProductStat(label: 'Vendus', value: '16'),
                      ProductStat(label: 'Popularité', value: '4.8'),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Naviguer vers l'écran d'ajout de produit
                      Navigator.pushNamed(context, "ajoutArticle");
                    },
                    child: Text('Ajouter un Nouveau Produit'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Vos Commandes',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          // Liste des commandes avec leur statut
          // ...
          Container(
            height: 300.0,
            child: charts.BarChart(
              _getSoldProductsData(),
              animate: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Produits en Stock',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 300.0,
            child: charts.BarChart(
              _getStockProductsData(),
              animate: true,
            ),
          ),
        ],
      ),
    );
  }

  // ... Le reste du code reste inchangé

  List<charts.Series<Product, String>> _getSoldProductsData() {
    final data = [
      Product('Produit A', 7),
      Product('Produit B', 6),
      Product('Produit C', 3),
    ];
    return [
      charts.Series<Product, String>(
        id: 'Ventes',
        domainFn: (Product product, _) => product.name,
        measureFn: (Product product, _) => product.quantity,
        data: data,
        labelAccessorFn: (Product product, _) => '${product.quantity}',
      ),
    ];
  }

  List<charts.Series<Product, String>> _getStockProductsData() {
    final data = [
      Product('Produit A', 10),
      Product('Produit B', 7),
      Product('Produit C', 7),
    ];
    return [
      charts.Series<Product, String>(
        id: 'Stock',
        domainFn: (Product product, _) => product.name,
        measureFn: (Product product, _) => product.quantity,
        data: data,
        labelAccessorFn: (Product product, _) => '${product.quantity}',
      ),
    ];
  }
}

class ProductStat extends StatelessWidget {
  final String label;
  final String value;
  ProductStat({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}

class Product {
  final String name;
  final int quantity;
  Product(this.name, this.quantity);
}
