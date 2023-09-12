import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:diayma/widgets/ItemAppBar.dart';
import 'package:diayma/widgets/ItemBottomNavBar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// Produit

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          ItemAppBar(),
          Padding(
            padding: EdgeInsets.all(16),
            child: Image.asset(
              "images/2.png",
              height: 300,
            ),
          ),
          Arc(
            edge: Edge.TOP,
            arcType: ArcType.CONVEY,
            height: 30,
            child: Container(
              width: double.infinity,
              color: Color(0xFFEDECF2),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 50,
                        bottom: 20,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Titre Produit",
                            style: TextStyle(
                              fontSize: 28,
                              color: Color(0xFF4C62A6),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBar.builder(
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemSize: 32,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 255, 230, 0),
                            ),
                            onRatingUpdate: (Index) {},
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color(0xFFEDECF2),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: Offset(0, 3)),
                                  ],
                                ),
                                child: Icon(
                                  CupertinoIcons.minus,
                                  size: 18,
                                  color: Color(0xFF4C62A6),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "01",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4C62A6),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color(0xFFEDECF2),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: Offset(0, 3)),
                                  ],
                                ),
                                child: Icon(
                                  CupertinoIcons.plus,
                                  size: 18,
                                  color: Color(0xFF4C62A6),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Plus de details sur le produit. Maa nam fii laniouye wakhei su fekei lamouye ndiaye bi daffa lihhh walleuh daffeuhh laaaa.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFF4C62A6),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ItemBottomNavBar(),
    );
  }
}
