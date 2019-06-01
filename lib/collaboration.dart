import 'package:flutter/material.dart';
class Collaborations extends StatefulWidget{
  @override
  _CollaborationsState createState() => _CollaborationsState();
}

class _CollaborationsState extends State<Collaborations> {
  TextEditingController _searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            textInputAction: TextInputAction.done,
            controller: _searchController,
            style: TextStyle(fontSize: 14,letterSpacing: 8,),
            textAlign: TextAlign.center,
            validator: (value){
              if(value.isEmpty){
                return 'Enter a value';
              }
            },
            decoration:InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(5.0)
                    )
                ),
                hintStyle: new TextStyle(fontSize: 14,letterSpacing: 1),
                labelStyle: new TextStyle(fontSize: 14,letterSpacing: 1),
                labelText: 'Collaboratios',
                prefixStyle: TextStyle(color: Theme.of(context).primaryColorDark)
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        SelectedList(children: ['All','Mine','With me'],)
      ],
    );
  }
}
class SelectedList extends StatefulWidget{
  final List<String> children;
  const SelectedList({Key key, this.children}) : super(key: key);
  @override
  _SelectedListState createState() => _SelectedListState();
}

class _SelectedListState extends State<SelectedList> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize:  MainAxisSize.min,
      children: List.generate(widget.children.length, (index){
        return new Expanded(child: GestureDetector(
          onTap: (){
            setState(() {
              _selectedIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 4,left: 4),
            child: Container(
              child: Center(child: Text(widget.children[index],style: TextStyle(color: Colors.white),)),
              padding: EdgeInsets.all(10),
              decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),color: _selectedIndex == index ? Theme.of(context).primaryColor : Colors.grey[400]),
            ),
          ),
        ));
      }),
    );
  }
}