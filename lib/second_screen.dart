import 'package:flutter/material.dart';

import 'zoom_scaffold.dart';

final secondScreen = Screen(
    title: 'Second Screen',
    background: DecorationImage(
      image: AssetImage('assets/other_screen_bk.jpg'),
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(Color(0xAA000000), BlendMode.multiply),
    ),
    contentBuilder: (BuildContext context) {
      return Container(
          color: Colors.transparent,
          child: Center(
            child: Container(
              height: 300.0,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/other_screen_card_photo.jpg'),
                      Expanded(
                        child: Center(
                          child: Text('this is a second screen'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
    });
