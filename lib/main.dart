import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hidden_drawer/zoom_scaffold.dart';

import 'account_screen.dart';
import 'dashboard_screen.dart';
import 'login_screen.dart';
import 'menu.dart';
import 'provider_classes.dart';
import 'second_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hack_19',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal, brightness: Brightness.dark),
      home: LoginPage(),
    );
  }
}

class HomePagePreprocessor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ScreenChangeNotifier>(
      builder: (_) => ScreenChangeNotifier('_'),
      child: HomePage(),
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

  var selectedMenuItemId;
  var activeScreen;
  @override
  void initState() {
    super.initState();
    
    selectedMenuItemId = 'dashboard';
    activeScreen = dashboardScreen;
  }

  @override
  Widget build(BuildContext context) {
    return ZoomScaffold(
      contentScreen: activeScreen,
      menuScreen: MenuScreen(
        menu: menu,
        selectedItemId: selectedMenuItemId,
        onMenuItemSelected: (String itemId) {
          selectedMenuItemId = itemId;
          switch (itemId) {
            case 'dashboard':
              setState(() {
                Provider.of<ScreenChangeNotifier>(context).updateId(itemId);
                selectedMenuItemId = Provider.of<ScreenChangeNotifier>(context).getId();
                Provider.of<ScreenChangeNotifier>(context).updateScreen(dashboardScreen);
                activeScreen = Provider.of<ScreenChangeNotifier>(context).getScreen();
              });
              break;
            case 'account': setState(() {
             Provider.of<ScreenChangeNotifier>(context).updateId(itemId);
                selectedMenuItemId = Provider.of<ScreenChangeNotifier>(context).getId();
                Provider.of<ScreenChangeNotifier>(context).updateScreen(accountScreen);
                activeScreen = Provider.of<ScreenChangeNotifier>(context).getScreen();
            });
             break;
            case 'logout':
              Navigator.of(context).pop(); //TODO: something to do with sessions.
              break;

            default:
              setState(() {
                // selectedMenuItemId = Provider.of<ScreenChangeNotifier>(context).updateId(itemId);
                Provider.of<ScreenChangeNotifier>(context).updateScreen(secondScreen);
                activeScreen = Provider.of<ScreenChangeNotifier>(context).getScreen();
              });
          }
        },
      ),
    );
  }
}
