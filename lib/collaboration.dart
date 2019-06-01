import 'package:flutter/material.dart';
import 'package:hidden_drawer/chat_screen.dart';
class Collaborations extends StatefulWidget{
  @override
  _CollaborationsState createState() => _CollaborationsState();
}

class _CollaborationsState extends State<Collaborations> {
  List<Collaboration> collaborations = [new Collaboration('Mine', 'Ravi'),new Collaboration('With me', 'Gokul'),new Collaboration('Mine', 'Nassar'),new Collaboration('With me', 'Benjith'),new Collaboration('Mine', 'Prabeen'),new Collaboration('With me', 'Shanib')] /*['Ravi','Gokul','Nassar','Benjith','Prabeen','Shanib']*/;
  List<Collaboration> masterCollaboration = List();
  double screenSize;
  String _selectedType = 'All';
  @override
  void initState() {
    masterCollaboration.addAll(collaborations);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: new InputDecoration(
                prefixIcon: new Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
            ),
            onChanged: (String query){
              filter(_selectedType,query);
            },
          ),
        ),
        SelectedList(onSelect: (String selected){
          setState(() {
            _selectedType = selected;
          });
        },children: ['All','Mine','With me'],),
        Expanded(
          child: ListView(children:List.generate(collaborations.length, (index){
            return InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(info: new ChatRoom(user: collaborations[index].name),))),
              child: new Card(
                elevation: 2.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        width: (screenSize/10)*2,
                        height: (screenSize/10)*2,
                        child: new CircleAvatar(
                          child: new Image.network('http://res.cloudinary.com/kennyy/image/upload/v1531317427/avatar_z1rc6f.png'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(collaborations[index].name,style: TextStyle(color: Colors.grey[800]),),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),),
        )
      ],
    );
  }
  filter(String type, String name){
    List<Collaboration> items = List();
    if(name != ''){
      for(Collaboration item in masterCollaboration){
        if(item.type==type && item.name.toLowerCase().contains(name.toLowerCase())){
          items.add(item);
        }
      }
    }
    else{
      items.addAll(masterCollaboration);
    }
    setState(() {
      collaborations = items;
    });
  }
}
class Collaboration{
  final String type;
  final String name;
  Collaboration(this.type, this.name);
}
typedef SelectedCallback(String selected);
class SelectedList extends StatefulWidget{
  final List<String> children;
  final SelectedCallback onSelect;
  const SelectedList({Key key, this.children, this.onSelect}) : super(key: key);
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
              widget.onSelect(widget.children[index]);
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