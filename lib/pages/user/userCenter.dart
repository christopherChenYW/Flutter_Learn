import 'package:flutter/material.dart';

class UserCenter extends StatefulWidget {
  UserCenter({Key key}) : super(key: key);

  @override
  _UserCenterState createState() => _UserCenterState();
}

class _UserCenterState extends State<UserCenter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.arrow_upward),
          mini: false,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          title: Text('ni'),
        ),
        body: Center(
            child: Row(children: [
          OutlinedButton(onPressed: () {}, child: Text("OutLineButton")),
          TextButton(
            onPressed: () {},
            child: Text("Text按钮"),
          ),
          Text("传说中人类"),
          ElevatedButton.icon(
            onPressed: () => {},
            icon: Icon(Icons.search),
            label: Text('搜索'),
            style: ButtonStyle(
                shape: MaterialStateProperty.all(StadiumBorder(
              //StadiumBorder半圆角按钮，圆形可以设置CircularBorder

              side: BorderSide(
                  color: Colors.pink, width: 0.5, style: BorderStyle.solid),
            ))),
          )
        ])),
      ),
    );
  }
}
