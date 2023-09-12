import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              // Retour vers page d'accueil
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Color(0xFF4C62A6),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Panier",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C62A6),
              ),
            ),
          ),
          Spacer(),
          Icon(
            Icons.more_vert,
            size: 30,
            color: Color(0xFF4C62A6),
          ),
        ],
      ),
    );
  }
}
