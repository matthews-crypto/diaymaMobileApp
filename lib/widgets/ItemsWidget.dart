import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      // it disable the scroll functionality of gridview
      // then it will scroll in list view of home page
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 1; i < 8; i++)
          Container(
            padding: EdgeInsets.only(left: 15, top: 10),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xFF4C42A6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "-40%",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    RatingBar.builder(
                      initialRating: 0,
                      //minRating: 1,
                      direction: Axis.horizontal,
                      itemCount: 1,
                      itemSize: 22,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4),
                      itemBuilder: (context, _) => Icon(
                        Icons.favorite,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                      onRatingUpdate: (Index) {},
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "itemPage");
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Image.asset(
                      "images/$i.png",
                      height: 120,
                      width: 120,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Titre Produit",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF4C62A6),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Desription produit",
                    style: TextStyle(fontSize: 15, color: Color(0xFF4C62A6)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "500 cfa",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C62A6),
                        ),
                      ),
                      Icon(
                        Icons.shopping_cart_checkout,
                        size: 19,
                        color: Color(0xFF4C62A6),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
