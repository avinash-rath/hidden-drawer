import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget{
  final ChatRoom info;
  ChatScreen({@required this.info});
  _ChatScreen createState() => new _ChatScreen();
}
class _ChatScreen extends State<ChatScreen> {
  List<Bubble> chats = List();
  var chatsLoaded = false;
  final TextEditingController _chatController = new TextEditingController();
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
//    _loadChats();
  chatsLoaded = true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: .9,
        title: Text(
          widget.info.user,
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: chatsLoaded ? new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Flexible(
            child: Padding(
                padding: EdgeInsets.all(5.0),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  controller: _scrollController,
                  children: List.generate(chats.length, (index){
                    return new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          chats[index],
                        ]
                    );
                  }),
                )
            ),
          ),
          new Divider(
            height: 1.0,
          ),
          new Container(decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
            child: _chatEnvironment(),)
        ],
      ): Center(child: CircularProgressIndicator(),),
    );
  }
  _sendMessage(Bubble message)async{
    Future.delayed(Duration(seconds: 3),(){
      for(int i=0; i<chats.length; i++){
        if(chats[i]==message){
          chats[i] = new Bubble(message:message.message,time: message.time,delivered: true,isMe:message.isMe);
        }
      }
      if(mounted){
        setState(() {
          chats = chats;
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        });
      }
    });
  }
  Widget _chatEnvironment (){
    return IconTheme(
      data: new IconThemeData(color: Colors.blue),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal:8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(hintText: "Start typing ..."),
                controller: _chatController,
                onSubmitted:  _handleSubmit,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send,color: Colors.pink,),
                onPressed: ()=> _chatController.text.length>0 ?  _handleSubmit(_chatController.text) : null,
              ),
            )
          ],
        ),
      ),
    );
  }
  void _handleSubmit(String text) {
    _chatController.clear();
    Bubble message = new Bubble(message: text,isMe: false,time: getCurrentTime(),delivered: false);
    setState(() {
      chats.add(message);
    });
    _sendMessage(message);
  }
  String getCurrentTime(){
    var date = new DateTime.now();
    return date.hour.toString()+":"+date.minute.toString()+":"+date.second.toString();
  }
  String getTime(String date){
    List<String> s = date.split(' ');
    return s[1];
  }
}
class Bubble extends StatelessWidget {
  Bubble({this.message, this.time, this.delivered, this.isMe});
  final String message, time;
  final delivered, isMe;
  @override
  Widget build(BuildContext context) {
    final bg = isMe ? Colors.white : Colors.greenAccent.shade100;
    final align = isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final icon = delivered ? Icons.done : Icons.access_time;
    final radius = isMe
        ? BorderRadius.only(
      topRight: Radius.circular(5.0),
      bottomLeft: Radius.circular(10.0),
      bottomRight: Radius.circular(5.0),
    )
        : BorderRadius.only(
      topLeft: Radius.circular(5.0),
      bottomLeft: Radius.circular(5.0),
      bottomRight: Radius.circular(10.0),
    );
    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(3.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: .5,
                  spreadRadius: 1.0,
                  color: Colors.black.withOpacity(.12))
            ],
            color: bg,
            borderRadius: radius,
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 60.0),
                child: Text(message),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Row(
                  children: <Widget>[
                    Text(time,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 10.0,
                        )),
                    SizedBox(width: 3.0),
                    Icon(
                      icon,
                      size: 12.0,
                      color: Colors.black38,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
class ChatRoom{
  String id,appTopicRel,staffId,userId,createdOn,status,application,topic,user;
  ChatRoom({this.user});
  ChatRoom._({this.appTopicRel,this.id,this.createdOn,this.staffId,this.status,this.userId,this.topic,this.application,this.user});
  factory ChatRoom.fromJson(Map<String,dynamic> json){
    return ChatRoom._(
        id: json['id'],
        appTopicRel: json['app_topic_rel_id'],
        staffId: json['staff_id'],
        userId: json['user_id'],
        createdOn: json['created_on'],
        status: json['status'],
        application: json['application'],
        topic: json['topic'],
        user: json['user']
    );
  }
}