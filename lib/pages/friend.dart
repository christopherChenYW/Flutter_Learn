import 'dart:convert';

import 'package:flutter/material.dart';

class friendPage extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<friendPage> {
  int countNum = 0;

  addCount() {
    var data = '{"name": "zhangsan", "boddy": "haha"}';
    print(json.decode(data)['name']);
    if (mounted)
      this.setState(() {
        this.countNum++;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 200,
                          child: ListView(
                            children: [
                              ListTile(
                                title: Text("Optaion A"),
                              ),
                              Divider(),
                              ListTile(
                                title: Text("Optaion A"),
                              ),
                              Divider(),
                              ListTile(
                                title: Text("Optaion A"),
                              ),
                              Divider(),
                              ListTile(
                                title: Text("Optaion A"),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Text("showModalBottomSheet")),
            SizedBox(
              height: 300,
            ),
            Chip(
              label: Text(
                "${this.countNum}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: addCount,
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
