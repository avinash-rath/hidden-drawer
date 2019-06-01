import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hidden_drawer/collaboration.dart';

//import 'menu.dart';

class ZoomScaffold extends StatefulWidget {
  final Screen contentScreen;
  final Widget menuScreen;

  ZoomScaffold({this.contentScreen, this.menuScreen});

  @override
  _ZoomScaffoldState createState() => _ZoomScaffoldState();
}

class _ZoomScaffoldState extends State<ZoomScaffold>
    with TickerProviderStateMixin {

  Widget _view;
  int _currentIndex = 0;
  MenuController menuController;
  Curve scaleDownCurve = Interval(0.0, 0.3, curve: Curves.easeOut);
  Curve scaleUpCurve = Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideOutCurve = Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideInCurve = Interval(0.0, 1.0, curve: Curves.easeOut);


  @override
  void initState() {
    super.initState();
    _view = widget.contentScreen.contentBuilder(context);
    menuController = MenuController(vsync: this)
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  zoomAndSlideContent(Widget content) {
    var slidePercent, scalePercent;
    switch (menuController.state) {
      case MenuState.closed:
        slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
        slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
        slidePercent = slideOutCurve.transform(menuController.percentOpen);
        scalePercent = scaleDownCurve.transform(menuController.percentOpen);
        break;
      case MenuState.closing:
        slidePercent = slideInCurve.transform(menuController.percentOpen);
        scalePercent = scaleUpCurve.transform(menuController.percentOpen);
        break;
      default:
    }

    final slideAmount = 275.0 * slidePercent;
    final contentScale = 1.0 - (0.2 * scalePercent);
    final cornerRadius = 10.0 * menuController.percentOpen;

    return Transform(
      transform: Matrix4.translationValues(
        slideAmount,
        0.0,
        0.0,
      )..scale(contentScale, contentScale),
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x440000000),
              offset: Offset(0.0, 5.0),
              blurRadius: 20.0,
              spreadRadius: 10.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(cornerRadius),
          child: content,
        ),
      ),
    );
  }

  createContentDisplay() {
    return zoomAndSlideContent(
      Container(
        decoration: BoxDecoration(image: widget.contentScreen.background),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
              widget.contentScreen.title,
              style: TextStyle(
                fontFamily: 'bebas-neue',
                fontSize: 25.0,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                menuController.toggle();
              },
            ),
          ),
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
                activeIcon: Icon(MaterialCommunityIcons.account_group,color: Theme.of(context).primaryColor,),
                title: Text('collaboration'.toUpperCase())),
            ],
          ),
          body: _view,
        ),
      ),
    );
  }

  Widget _getView (int index) {
    switch(index){
      case 0: return widget.contentScreen.contentBuilder(context); 
      case 1: return Collaborations();
      default: return widget.contentScreen.contentBuilder(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.menuScreen,
        createContentDisplay(),
      ],
    );
  }
}

class ZoomScaffoldMenuController extends StatefulWidget {
  final ZoomScaffoldBuilder builder;

  ZoomScaffoldMenuController({this.builder});

  @override
  _ZoomScaffoldMenuControllerState createState() =>
      _ZoomScaffoldMenuControllerState();
}

class _ZoomScaffoldMenuControllerState
    extends State<ZoomScaffoldMenuController> {
  MenuController menuController;

  @override
  void initState() {
    super.initState();

    menuController = getMenuController(context);
    menuController.addListener(_onMenuControllerChange);
  }

  @override
  void dispose() {
    menuController.removeListener(_onMenuControllerChange);
    super.dispose();
  }

  getMenuController(BuildContext context) {
    final scaffoldState =
        context.ancestorStateOfType(TypeMatcher<_ZoomScaffoldState>())
            as _ZoomScaffoldState;
    return scaffoldState.menuController;
  }

  _onMenuControllerChange () {
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, getMenuController(context));
  }
}

typedef Widget ZoomScaffoldBuilder(
    BuildContext context, MenuController controller);

class Screen {
  final String title;
  final DecorationImage background;
  final WidgetBuilder contentBuilder;

  Screen({
    this.title,
    this.background,
    this.contentBuilder,
  });
}

class MenuController extends ChangeNotifier {
  final TickerProvider vsync;
  final AnimationController _animationController;
  MenuState state = MenuState.closed;

  MenuController({this.vsync})
      : _animationController = AnimationController(vsync: vsync) {
    _animationController
      ..duration = Duration(milliseconds: 250)
      ..addListener(() {
        notifyListeners();
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            state = MenuState.opening;
            break;
          case AnimationStatus.dismissed:
            state = MenuState.closed;
            break;
          case AnimationStatus.reverse:
            state = MenuState.closing;
            break;
          case AnimationStatus.completed:
            state = MenuState.open;
            break;
        }
        notifyListeners();
      });
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  get percentOpen {
    return _animationController.value;
  }

  open() {
    _animationController.forward();
  }

  close() {
    _animationController.reverse();
  }

  toggle() { // Toggling the states.
    if (state == MenuState.closed) {
      open();
      notifyListeners(); // Callback to listeners for state change.
    } else if (state == MenuState.open) {
      close();
      notifyListeners();
    }
  }

}

enum MenuState {
  closed,
  closing,
  open,
  opening,
}
