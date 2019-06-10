import 'package:flutter/material.dart';

import 'zoom_scaffold.dart';

final accountScreen = new Screen(
  background: DecorationImage(
    image: AssetImage('assets/grey_grunge_bk.jpg'),
    fit: BoxFit.cover,
  ),
  title: 'ACCOUNT',
  contentBuilder: (BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                    width: 100.0,
                    height: 100.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      // TODO: use provider to get user image. StreamProvider?
                      child: Image.asset('assets/44.jpg'),
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 25.0,
                ),
                // TODO: User-Name to be fetched using Database. StreamProvider?
                child: Text(
                  'User Name',
                  style: TextStyle(
                    fontFamily: 'bebas-neue',
                    fontSize: 20.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: IconButton(
                  // TODO: Add edit option.
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          _createRow('Email', 'email@emaple.com'),
          _createRow('Github', 'github.com/userName123'),
          _createRow('category', 'value'),
        ],
      ),
    );
  },
);

Widget _createRow(String category, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 25.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            '$category  :',
            style: TextStyle(
              fontSize: 19.0,
              fontFamily: 'bebas-neue',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Text(
            '$value',
            style: TextStyle(
              fontFamily: 'bebas-neue',
              fontSize: 21.0,
            ),
          ),
        ),
      ],
    ),
  );
}
