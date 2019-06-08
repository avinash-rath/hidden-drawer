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
        id: 'dashboard',
        title: 'HOME PAGE',
      ),
      new MenuItem(
        id: 'account',
        title: 'ACCOUNT',
      ),
      new MenuItem(
        id: 'settings',
        title: 'SETTINGS',
      ),
      new MenuItem(
        id: 'logout',
        title: 'LOGOUT',
      ),
    ],
);

  var selectedMenuItemId = 'dashboard';
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
          switch(itemId){
            case 'restaurant' : setState(() {
              activeScreen = restaurantScreen;
            });
            break;

            case 'logout' : Navigator.of(context).pop(); break;

            default : setState(() {
              activeScreen = secondScreen;
            }); 
          }
          // if(itemId == 'restaurant'){
          //   setState(() {
          //    activeScreen = restaurantScreen; 
          //   });
          // }else{
          //   setState(() {
          //    activeScreen = secondScreen; 
          //   });
          // }
        },
      ),
    );
  }
}
