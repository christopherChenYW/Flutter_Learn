import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final arguments;

  const SearchPage({Key key, this.arguments = 'arguments'}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('欢迎${this.arguments['id']}'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('返回'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
