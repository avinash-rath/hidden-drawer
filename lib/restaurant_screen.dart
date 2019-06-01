import 'package:flutter/material.dart';

import 'zoom_scaffold.dart';

final restaurantScreen = Screen(
    title: 'The Paleo Paddock',
    background: DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage('assets/wood_bk.jpg'),
    ),
    contentBuilder: (BuildContext context) {
      return ListView(
        children: <Widget>[
          _RestaurantCard(
            headImageAssetPath: 'assets/eggs_in_skillet.jpg',
            icon: Icons.fastfood,
            iconBackgroundColor: Colors.orange,
            title: 'il Domacca',
            subtitle: '78 5TH AVENUE, NEW YORK',
            heartCount: 84,
          ),
          _RestaurantCard(
            headImageAssetPath: 'assets/spoons_of_spices.jpg',
            iconBackgroundColor: Colors.red,
            icon: Icons.local_dining,
            title: 'Mc Grady',
            subtitle: '79 5th Avenue',
            heartCount: 79,
          ),
          _RestaurantCard(
            headImageAssetPath: 'assets/steak_on_cooktop.jpg',
            icon: Icons.fastfood,
            iconBackgroundColor: Colors.purpleAccent,
            title: 'Steaks a lot',
            subtitle: '22 6th Avenue',
            heartCount: 36,
          ),
        ],
      );
    });

class _RestaurantCard extends StatelessWidget {
  final String headImageAssetPath;
  final IconData icon;
  final Color iconBackgroundColor;
  final String title;
  final String subtitle;
  final int heartCount;

  _RestaurantCard({
    this.headImageAssetPath,
    this.icon,
    this.iconBackgroundColor,
    this.title,
    this.subtitle,
    this.heartCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Card(
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            Image.asset(
              headImageAssetPath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150.0,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: iconBackgroundColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'mermaid',
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'bebas-neue0',
                          color: Color(0xFFAAAAAA),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 2.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white,
                        Color(0xFFAAAAAA),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                      Text('$heartCount'),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}