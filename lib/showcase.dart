import 'package:flutter/material.dart';

class ShowCase extends StatefulWidget {
  @override
  _ShowCaseState createState() => _ShowCaseState();
}

class _ShowCaseState extends State<ShowCase> {
  // static PageController controller1 =
  //     PageController(initialPage: images1.length - 1);
  //     static PageController controller2 =
  //     PageController(initialPage: images1.length - 1);
  // double currentPage = 0.0;
  List<Card> showCaseItems = [
    Card(
      elevation: 0.0,
      child: Container(
        height: 200.0,
        child: Image.asset('1.jpg',fit: BoxFit.contain,),
      ),
    ),
    Card(
      elevation: 0.0,
      child: Container(
        height: 200.0,
        child: Image.asset('12.jpg',fit: BoxFit.contain,),
      ),
    )
  ];
 // static List<String> images1 = [
 //   '1.jpg',
   // '12.jpg',
    //'3.jpg',
  //];
  //static List<String> images2 = [
    //'4.jpg',
    //'5.jpg',
    //'6.jpg',
 // ];
  @override
  Widget build(BuildContext context) {
    // controller1.addListener(() {
    //   setState(() {
    //     currentPage = controller1.page;
    //   });
    // });
    // controller2.addListener(() {
    //   setState(() {
    //     currentPage = controller2.page;
    //   });
    // });
    return Container();
    // return Padding(
    //   padding: EdgeInsets.all(10.0),
    //   child: ListView.builder(
    //     itemCount: 2,
    //     itemBuilder: (BuildContext context, int count) {
    //       return showCaseItems[count];
    //     },
    //   ),
    // );
  }
}
