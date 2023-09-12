import 'package:flutter/material.dart';
import 'package:diayma/chatbot/chatvocal.dart';

class ChoixPage extends StatefulWidget {
  @override
  _ChoixPageState createState() => _ChoixPageState();
}

class _ChoixPageState extends State<ChoixPage> {
  void _showConfirmation(String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Vous avez choisi $action'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Achat et Vente'),
        backgroundColor: Colors.blue,
      ),
      // Le corps de la page
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Le bouton d'achat
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'homePage');
              },
              child: Text('Achat'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            // Le bouton de vente
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'vendeurPage');
              },
              child: Text('Vente'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
            AudioPlayerWidget(
              audioPath: 'asset:///assets/audio/AchatVente.mp3',
            ),
          ],
        ),
      ),
    );
  }
}
// ©matthews-crypto