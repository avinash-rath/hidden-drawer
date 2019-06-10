import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import 'collaboration.dart';
import 'provider_classes.dart';
import 'showcase.dart';
import 'zoom_scaffold.dart';

final dashboardScreen = Screen(
    title: 'HOME',
    background: DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage('assets/grey_grunge_bk.jpg'),
    ),
    contentBuilder: (BuildContext context) {
      return DashboardScaffold();
    });

class DashboardScaffold extends StatefulWidget {
  @override
  _DashboardScaffoldState createState() => _DashboardScaffoldState();
}

class _DashboardScaffoldState extends State<DashboardScaffold> {
  Widget _view;
  int _currentIndex = 0;

  var dashboardScaffold = ChangeNotifierProvider<HeartCounter>(
        builder: (_) => HeartCounter(0),
              child: ListView(
          children: <Widget>[
            _NewsCard(
              headImageAssetPath: 'assets/app-643.png',
              profilePic: 'assets/10.jpg',
              iconBackgroundColor: Colors.orange,
              title: 'MetaFlutter',
              subtitle:
                  'Learn, explore and experiment with Flutter widgets directly on your phone.',
              heartCount: 84,
              tags: ['app', 'web'],
            ),
            _NewsCard(
              headImageAssetPath: 'assets/2.png',
              iconBackgroundColor: Colors.red,
              profilePic: 'assets/11.jpg',
              title: 'AntiClamper',
              subtitle: 'Simple, smart parking tracker',
              heartCount: 79,
              tags: ['app', 'android', 'open Bugs'],
            ),
            _NewsCard(
              headImageAssetPath: 'assets/3.png',
              profilePic: 'assets/44.jpg',
              iconBackgroundColor: Colors.purpleAccent,
              title: 'REQU by Ameba',
              subtitle:
                  'REQU App is the best way to sell your unique skills online.',
              heartCount: 36,
              tags: ['app', 'iOS'],
            ),
            _NewsCard(
              headImageAssetPath: 'assets/4.png',
              iconBackgroundColor: Colors.red,
              profilePic: 'assets/45.jpg',
              title: 'Cipherly',
              subtitle: 'A Password Manager built using flutter!',
              heartCount: 79,
              tags: ['app', 'android', 'open Bugs'],
            ),
            _NewsCard(
              headImageAssetPath: 'assets/5.png',
              profilePic: 'assets/2.jpg',
              iconBackgroundColor: Colors.purpleAccent,
              title: 'GiveActions',
              subtitle:
                  'Realize actions to make free donations to associative projects!',
              heartCount: 36,
              tags: ['app', 'iOS'],
            ),
            _NewsCard(
              headImageAssetPath: 'assets/7.png',
              profilePic: 'assets/78.jpg',
              iconBackgroundColor: Colors.purpleAccent,
              title: 'The Pocket Piano',
              subtitle:
                  'The Pocket Piano is a fully featured piano optimized for all screen sizes.',
              heartCount: 187,
              tags: ['app', 'iOS'],
            ),
          ],
        ),
      );
  @override
  void initState() {
    super.initState();
    _view = dashboardScaffold;
  }

  Widget _getView(int index) {
    switch (index) {
      case 0:
        return dashboardScaffold;
      case 1:
        return Collaborations();
      case 2:
        return ShowCase();
      default:
        return dashboardScaffold;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _view,
      bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _view = _getView(index);
                _currentIndex = index;
              });
            },
            items: [
              new BottomNavigationBarItem(
                  icon: Icon(MaterialCommunityIcons.view_dashboard_outline),
                  activeIcon: Icon(MaterialCommunityIcons.view_dashboard),
                  title: Text('feed'.toUpperCase())),
              new BottomNavigationBarItem(
                  icon: Icon(MaterialCommunityIcons.account_group_outline),
                  activeIcon: Icon(
                    MaterialCommunityIcons.account_group,
                  ),
                  title: Text('Collaboration'.toUpperCase())),
              new BottomNavigationBarItem(
                  icon:
                      Icon(MaterialCommunityIcons.account_arrow_right_outline),
                  activeIcon: Icon(
                    MaterialCommunityIcons.account_group,
                  ),
                  title: Text('ShowCase'.toUpperCase())),
            ],
          ),
    );
  }
}

class _NewsCard extends StatefulWidget {
  final String headImageAssetPath;
  final String profilePic;
  final Color iconBackgroundColor;
  final String title;
  final String subtitle;
  final int heartCount;
  final List<String> tags;

  _NewsCard({
    this.headImageAssetPath,
    this.profilePic,
    this.iconBackgroundColor,
    this.title,
    this.subtitle,
    this.tags,
    this.heartCount,
  });

  @override
  __NewsCardState createState() => __NewsCardState();
}

class __NewsCardState extends State<_NewsCard> {
  int currentCounter;
  bool isSelected = false;

  @override
  initState() {
    super.initState();
    currentCounter = widget.heartCount;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _tagsChips = widget.tags != null
        ? (widget.tags.map<Widget>((String name) {
            return Chip(
              key: ValueKey<String>(name),
              backgroundColor: _nameToColor(name),
              label: Text(_capitalize(name)),
              // onDeleted: () {
              //   setState(() {
              //     _removeMaterial(name);
              //   });
              // },
            );
          }).toList())
        : [];
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Card(
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            Image.asset(
              widget.headImageAssetPath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 100.0,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        color: widget.iconBackgroundColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Image.asset(
                        widget.profilePic,
                        fit: BoxFit.fill,
                        width: 40,
                        height: 40,
                      )),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'mermaid',
                        ),
                      ),
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'bebas-neue0',
                          color: Color(0xFFAAAAAA),
                        ),
                      ),
                      widget.tags != null && widget.tags.isNotEmpty
                          ? _ChipsTile(children: _tagsChips)
                          : Container()
                    ],
                  ),
                ),
                Container(
                  width: 2.0,
                  height: 75.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFAAAAAA),
                        Color(0xFFAAAAAA),
                        Colors.white,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Material(
                    child: InkWell(
                      splashColor: Colors.black.withOpacity(0.5),
                      onTap: () {
                        setState(() {
                          Provider.of<HeartCounter>(context).setCounter(currentCounter);
                          isSelected = !isSelected;
                          // TODO: implement increment counter in database.
                          isSelected
                              ? Provider.of<HeartCounter>(context).increment()
                              : Provider.of<HeartCounter>(context)
                                  .decrement();
                          currentCounter =
                              Provider.of<HeartCounter>(context).getCounter();
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          isSelected
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(
                                  MaterialCommunityIcons.charity,
                                  color: Colors.blue,
                                ),
                          Text('$currentCounter'),
                        ],
                      ),
                    ),
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

class _ChipsTile extends StatelessWidget {
  const _ChipsTile({
    Key key,
    this.label,
    this.children,
  }) : super(key: key);

  final String label;
  final List<Widget> children;

  // Wraps a list of chips into a ListTile for display as a section in the demo.
  @override
  Widget build(BuildContext context) {
    final List<Widget> cardChildren = <Widget>[
      label != null
          ? Container(
              padding: const EdgeInsets.only(top: 5.0, bottom: 2.0),
              alignment: Alignment.center,
              child: Text(label, textAlign: TextAlign.start),
            )
          : Container(),
    ];
    if (children.isNotEmpty) {
      cardChildren.add(Wrap(
          children: children.map<Widget>((Widget chip) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: chip,
        );
      }).toList()));
    } else {
      final TextStyle textStyle = Theme.of(context)
          .textTheme
          .caption
          .copyWith(fontStyle: FontStyle.italic);
      cardChildren.add(Semantics(
        container: true,
        child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(minWidth: 48.0, minHeight: 48.0),
          padding: const EdgeInsets.all(8.0),
          child: Text('None', style: textStyle),
        ),
      ));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: cardChildren,
    );
  }
}

// This converts a String to a unique color, based on the hash value of the
// String object.  It takes the bottom 16 bits of the hash, and uses that to
// pick a hue for an HSV color, and then creates the color (with a preset
// saturation and value).  This means that any unique strings will also have
// unique colors, but they'll all be readable, since they have the same
// saturation and value.
Color _nameToColor(String name) {
  assert(name.length > 1);
  final int hash = name.hashCode & 0xffff;
  final double hue = (360.0 * hash / (1 << 15)) % 360.0;
  return HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();
}

String _capitalize(String name) {
  assert(name != null && name.isNotEmpty);
  return name.substring(0, 1).toUpperCase() + name.substring(1);
}
