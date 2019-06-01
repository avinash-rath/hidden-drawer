import 'package:flutter/material.dart';

class ShowCase extends StatefulWidget {
  @override
  _ShowCaseState createState() => _ShowCaseState();
}

class _ShowCaseState extends State<ShowCase> {

  List<Card>  showCaseItems = [];
  List<NetworkImage> images1 = [];
  List<NetworkImage> images2 = [];

  List<Card> getShowCaseItems() {
    //TODO: get images from network
  }

  List<NetworkImage> getImages1() {
    //TODO: get these images too
  }
  List<NetworkImage> getImages2() {
    //TODO: get these images too
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, int count) {
          return showCaseItems[count];
        },
      ),
    );
  }
}