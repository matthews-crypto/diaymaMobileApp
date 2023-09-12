import 'package:flutter/material.dart';
import 'package:diayma/widgets/CartBottomNavBar.dart';
import 'package:diayma/widgets/CartItemSamples.dart';
import '../widgets/CartAppBar.dart';

// PANIER

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return Scaffold(
      body: ListView(
        children: [
          CartAppBar(),
          Container(
            // temporaire height
            height: 700,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFEDECFA),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                CartItemSamples(),
                Container(
                  //decoration:
                  //    BoxDecoration(borderRadius: BorderRadius.circular(10)
                  //),
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF4C62A6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Ajout Article",
                          style: TextStyle(
                            color: Color(0xFF4C62A6),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CartBottomNavBar(),
    );
  }
}
