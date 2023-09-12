import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:diayma/chatbot/chatvocal.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//import 'package:audioplayers/audioplayers.dart';

class LoginPageRetour extends StatefulWidget {
  @override
  _LoginPageRetourState createState() => _LoginPageRetourState();
}

class _LoginPageRetourState extends State<LoginPageRetour> {
  // final AudioPlayer player = AudioPlayer(); // Créez une instance d'AudioPlayer

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // TextEditingController _userTypeControler =
  //     TextEditingController(text: "vendeur");
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.post(
      Uri.parse('http://192.168.0.86:8080/api/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'login': _usernameController.text,
        'motDePasse': _passwordController.text,
        // 'userType': _userTypeControler.text,
      }),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      // final token = json.decode(response.body)['token'];

      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setString('token', token);

      Navigator.pushReplacementNamed(context, 'choixPage');
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Authentication Error'),
          content: Text('Invalid credentials. Please try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Réessayer'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.lock,
                size: 80,
                color: const Color.fromARGB(255, 5, 5, 5),
              ),
              SizedBox(height: 28),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Login',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      child: Text('Connexion'),
                    ),
              AudioPlayerWidget(
                audioPath: 'asset:///assets/audio/LoginAudioRetour.mp3',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
