import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

class AjoutArticle extends StatefulWidget {
  @override
  _AjoutArticleWidgetState createState() => _AjoutArticleWidgetState();
}

class _AjoutArticleWidgetState extends State<AjoutArticle> {
  TextEditingController _nomProduitController = TextEditingController();
  TextEditingController _quantiteController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _prixController = TextEditingController();

  List<AssetImage> _selectedImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un Article'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          TextField(
            controller: _nomProduitController,
            decoration: InputDecoration(labelText: 'Nom du Produit'),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _quantiteController,
            decoration: InputDecoration(labelText: 'Quantité'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Description Globale'),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _prixController,
            decoration: InputDecoration(labelText: 'Prix'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              // Récupérer les données du formulaire
              String nomProduit = _nomProduitController.text;
              int quantite = int.tryParse(_quantiteController.text) ?? 0;
              String description = _descriptionController.text;
              double prix = double.tryParse(_prixController.text) ?? 0.0;
              String idVendeur = '20200A452';

              // Créer un modèle de données pour représenter le produit
              final produit = {
                'nom': nomProduit,
                'quantite': quantite,
                'description': description,
                'prix': prix,
                'idvendeur': idVendeur,
              };

              // Convertir le modèle de données en JSON
              final produitJson = jsonEncode(produit);

              // Envoyer les données à l'API
              final response = await http.post(
                Uri.parse('http://192.168.0.86:8080/api/products'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: produitJson,
              );

              if (response.statusCode == 200) {
                // La requête a réussi
                // Vous pouvez afficher un message de succès ou effectuer toute autre action nécessaire ici

                // Naviguer vers la page précédente
                Navigator.pop(context);
              } else {
                // La requête a échoué
                // Vous pouvez gérer les erreurs ou afficher un message d'erreur ici
                print('Erreur lors de la requête : ${response.statusCode}');
              }
            },
            child: Text('Ajouter l\'Article'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              // Permet à l'utilisateur de télécharger des images
              List<AssetImage> images = await _selectImages();
              if (images.isNotEmpty) {
                setState(() {
                  _selectedImages = images;
                });
              }
            },
            child: Text('Télécharger des Images'),
          ),
          SizedBox(height: 20),
          // Affiche les images sélectionnées
          _selectedImages.isEmpty
              ? Container()
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        3, // Vous pouvez ajuster le nombre de colonnes ici
                  ),
                  itemCount: _selectedImages.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Image(image: _selectedImages[index]);
                  },
                ),
        ],
      ),
    );
  }

  Future<List<AssetImage>> _selectImages() async {
    List<AssetImage> selectedImages = [];
    try {
      final pickedImages = await ImagePicker().pickMultiImage();
      if (pickedImages != null) {
        for (var imageFile in pickedImages) {
          selectedImages.add(AssetImage(imageFile.path));
        }
      }
    } on PlatformException catch (e) {
      print('Erreur lors de la sélection des images : $e');
    }

    return selectedImages;
  }

  @override
  void dispose() {
    _nomProduitController.dispose();
    _quantiteController.dispose();
    _descriptionController.dispose();
    _prixController.dispose();
    super.dispose();
  }
}
