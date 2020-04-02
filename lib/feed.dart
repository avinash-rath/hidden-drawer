import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Feeds extends StatefulWidget{
  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  List<_RestaurantCard> _feeds = List();
  @override
  void initState() {
    _feeds.add(new _RestaurantCard(title: 'Beta',icon: MaterialCommunityIcons.language_java,subtitle: 'Yeehaa',headImageAssetPath: 'Yahoo',heartCount: 10,iconBackgroundColor: Colors.redAccent,));
    _feeds.add(new _RestaurantCard(title: 'Beta',icon: MaterialCommunityIcons.language_cpp,subtitle: 'Yeehaa',headImageAssetPath: 'Yahoo',heartCount: 10,iconBackgroundColor: Colors.redAccent,));
    _feeds.add(new _RestaurantCard(title: 'Beta',icon: MaterialCommunityIcons.language_python,subtitle: 'Yeehaa',headImageAssetPath: 'Yahoo',heartCount: 10,iconBackgroundColor: Colors.redAccent,));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(_feeds.length, (index){
        return _feeds[index];
      }),
      scrollDirection: Axis.vertical,
    );
  }
}
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
                  height: 150.0,
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