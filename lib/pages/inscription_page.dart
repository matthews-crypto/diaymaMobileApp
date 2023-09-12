import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Importez le package http
import 'dart:convert'; // Importez le package json

class InscriptionPage extends StatefulWidget {
  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  // Créez des contrôleurs pour chaque champ de texte
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _nomController = TextEditingController();
  TextEditingController _telephoneController = TextEditingController();
  TextEditingController _motDePasseController = TextEditingController();

  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  // Créez une fonction pour envoyer les données à l'API
  Future<void> _envoyerDonnees() async {
    // Créez un objet JSON avec les données de l'utilisateur
    Map<String, dynamic> donnees = {
      'prenom': _prenomController.text,
      'nom': _nomController.text,
      'telephone': _telephoneController.text,
      'motDePasse': _motDePasseController.text,
    };

    // Envoyez une requête POST à l'URL de l'API avec le JSON comme corps
    http.Response response = await http.post(
      Uri.parse(
          'http://192.168.0.86:8080/api/inscription'), // Remplacez par votre URL d'API
      headers: {
        'Content-Type': 'application/json'
      }, // Spécifiez le type de contenu
      body: json.encode(donnees), // Encodez le JSON en chaîne
    );

    // Vérifiez le code de statut de la réponse
    if (response.statusCode == 200) {
      // La requête a réussi
      // Affichez un message de succès à l'utilisateur

      Navigator.pushNamedAndRemoveUntil(
        context,
        'login_page_retour',
        (Route<dynamic> route) => route.isFirst,
      );
    } else {
      // La requête a échoué
      // Affichez un message d'erreur à l'utilisateur
      _scaffoldMessengerKey.currentState!.showSnackBar(const SnackBar(
        content: Text('Inscription échoué!'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _scaffoldMessengerKey,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Registration Page'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller:
                        _prenomController, // Utilisez le contrôleur correspondant
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Prenom',
                      hintText: 'Bindeul seu tour',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 15),
                  child: TextField(
                    controller:
                        _nomController, // Utilisez le contrôleur correspondant
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nom',
                      hintText: 'Bindeul seu santeu',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 15),
                  child: TextField(
                    controller:
                        _telephoneController, // Utilisez le contrôleur correspondant
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Téléphone',
                      hintText: 'Bindeul sa numéro téléphone',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 15),
                  child: TextField(
                    controller:
                        _motDePasseController, // Utilisez le contrôleur correspondant
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mot de passe',
                      hintText: 'Bindeul sa code ',
                    ),
                  ),
                ),
                TextButton(
                  onPressed:
                      _envoyerDonnees, // Appelez la fonction créée lors du clic sur le bouton
                  child: Text(
                    'S\'inscrire',
                    style: TextStyle(color: Colors.white),
                  ),
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.blueAccent),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
