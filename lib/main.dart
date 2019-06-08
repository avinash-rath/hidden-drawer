import 'package:flutter/material.dart';
import 'package:hidden_drawer/zoom_scaffold.dart';

import 'dashboard_screen.dart';
import 'login_screen.dart';
import 'menu.dart';
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
  var activeScreen = dashboardScreen;

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
            case 'dashboard' : setState(() {
              activeScreen = dashboardScreen;
            });
            break;

            case 'logout' : Navigator.of(context).pop(); break;

            default : setState(() {
              activeScreen = secondScreen;
            }); 
          }
        },
      ),
    );
  }
}
