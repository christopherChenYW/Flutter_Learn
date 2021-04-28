import 'dart:async';

import 'package:flutter/material.dart';

class LoadingDialog extends StatefulWidget {
  final text;

  const LoadingDialog({Key key, this.text = "我们的故事"}) : super(key: key);

  @override
  _LoadingDialogState createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  _showTime() {
    if (mounted)
      Timer.periodic(Duration(seconds: 20), (timer) {
        //  取消定时器
        timer.cancel();
        Navigator.pop(context);
      });
  }

  @override
  Widget build(BuildContext context) {
    _showTime();
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Stack(children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.text,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.cancel),
                    ),
                  ),
                ]),
              ),
              Divider(),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "春天里的青草，\n夏天里的棉袄，\n春天夏天悄悄过去留下小秘密，\n就不搞搞,\n就不多少啊搞搞,\n就不搞都是搞,\n就不搞搞大声点",
                  textAlign: TextAlign.left,
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFFFFFFFF))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "确认",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
