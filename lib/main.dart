import 'package:flutter/material.dart';
import 'package:hidden_drawer/zoom_scaffold.dart';

import 'login_screen.dart';
import 'menu.dart';
import 'restaurant_screen.dart';
import 'second_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hack_19',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark
      ),
      home: LoginPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final menu = new Menu(
    items: [
      new MenuItem(
        id: 'restaurant',
        title: 'HOME PAGE',
      ),
      new MenuItem(
        id: 'other1',
        title: 'ACCOUNT',
      ),
      new MenuItem(
        id: 'other2',
        title: 'SETTINGS',
      ),
      new MenuItem(
        id: 'other3',
        title: 'LOGOUT',
      ),
    ],
);

  var selectedMenuItemId = 'restaurant';
  var activeScreen = restaurantScreen;

  @override
  Widget build(BuildContext context) {
    return ZoomScaffold(
      contentScreen: activeScreen,
      menuScreen: MenuScreen(
        menu : menu,
        selectedItemId: selectedMenuItemId,
        onMenuItemSelected: (String itemId) {
          selectedMenuItemId = itemId;
          if(itemId == 'restaurant'){
            setState(() {
             activeScreen = restaurantScreen; 
            });
          }else{
            setState(() {
             activeScreen = secondScreen; 
            });
          }
        },
      ),
    );
  }
}
