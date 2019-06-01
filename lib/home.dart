import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'collaboration.dart';
import 'feed.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _view;
  int _currentIndex = 0;
  @override
  void initState() {
    _view = Feeds();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text('connect'.toUpperCase(),style: TextStyle(letterSpacing: 5),),),
      drawer: new Drawer(
        child: new Container(),
      ),
      body: _view,
      bottomNavigationBar: new BottomNavigationBar(
          unselectedFontSize: 10,
          selectedFontSize: 10,
          onTap: (int index){
            setState(() {
              _view = _getView(index);
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          items: [
            new BottomNavigationBarItem(icon: Icon(MaterialCommunityIcons.view_dashboard_outline),activeIcon: Icon(MaterialCommunityIcons.view_dashboard),title: Text('feed'.toUpperCase())),
            new BottomNavigationBarItem(icon: Icon(MaterialCommunityIcons.account_group_outline),activeIcon: Icon(MaterialCommunityIcons.account_group),title: Text('collaboration'.toUpperCase())),
            new BottomNavigationBarItem(icon: Icon(MaterialCommunityIcons.account_circle_outline),activeIcon: Icon(MaterialCommunityIcons.account_circle),title: Text('account'.toUpperCase()))
          ]
      ),
    );
  }
  Widget _getView(int index){
    switch(index){
      case 0 : return Feeds();
      case 1 : return Collaborations();
      default : return Account();
    }
  }
}

class Account extends StatefulWidget{
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(),);
  }
}