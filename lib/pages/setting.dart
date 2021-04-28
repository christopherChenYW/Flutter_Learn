import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final _name = TextEditingController(); //初始化的时候赋值用的，如果不需要赋值则不需要
  String _password;

  bool _choose = true;
  int sex = 0;

  List hobby = [
    {
      'checked': true,
      'title': '吃饭',
      'subtitle': '喜欢吃饭的朋友们',
      'secondary': 'Icons.home'
    },
    {
      'checked': false,
      'title': '吃饭',
      'subtitle': '喜欢吃饭的朋友们',
      'secondary': 'Icons.home'
    },
    {
      'checked': true,
      'title': '吃饭',
      'subtitle': '喜欢吃饭的朋友们',
      'secondary': Icon(Icons.home)
    }
  ];
  DateTime _chooseTime = DateTime.now();
  TimeOfDay _chooseTimeConcrete = TimeOfDay(hour: 0, minute: 0);
  @override
  void initState() {
    super.initState();
    _name.text = "example@qq.com";
    print(formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]));
  }

  login() async {
    // showDialog( //展示自定义Dialog
    //     context: context,
    //     builder: (context) {
    //       return LoadingDialog(
    //         text: "登陆中",
    //       );
    //     });

    var url = Uri.parse('http://localhost:8080/login');
    var response = await http.post(url,
        body: {'userAccount': this._name.text, 'password': this._password});

    print(await http.read(Uri.parse('http://localhost:8080/test.txt')));
    Fluttertoast.showToast(
        msg: "登陆成功",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);

    Navigator.pushNamed(context, '/login',
        arguments: json.decode(response.body));

    // Navigator.of(context) //返回到主页面
    //     .push(MaterialPageRoute(builder: (context) => SearchPage()));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: 50),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                width: 350.0,
                height: 50.0,
                child: TextField(
                  onChanged: (value) {
                    _name.text = value;
                  },
                  controller: _name,
                  //这是一个文本框
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.people_alt,
                        color: Colors.blue,
                      ),
                      labelText: '用户账号',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                width: 350.0,
                height: 50.0,
                child: TextField(
                  obscureText: true,
                  cursorHeight: 10,
                  onChanged: (value) {
                    _password = value;
                  },
                  //这是一个文本框
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.text_fields,
                        color: Colors.blue,
                      ),
                      labelText: '密码',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(child: Text("登陆"), onPressed: login),
            SizedBox(width: 10),
            ElevatedButton(
              child: Text("注册"),
              onPressed: () {
                Navigator.pushNamed(context, '/register',
                    arguments: {'id': 12312312});
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => SearchPage()));
              },
            ),
          ],
        ),
        Column(
          children: hobby.map((e) {
            return CheckboxListTile(
                selected: e['checked'],
                title: Text(e['title']),
                subtitle: Text(e['subtitle']),
                secondary: Icon(Icons.computer),
                value: e['checked'],
                onChanged: (value) {
                  this.setState(() {
                    e['checked'] = value;
                  });
                });
          }).toList(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "男:",
                style: TextStyle(fontSize: 20),
              ),
              Radio(
                  value: 0,
                  groupValue: this.sex,
                  onChanged: (value) {
                    this.setState(() {
                      this.sex = value;
                    });
                  }),
              Text(
                "女:",
                style: TextStyle(fontSize: 20),
              ),
              Radio(
                  value: 1,
                  groupValue: this.sex,
                  onChanged: (value) {
                    this.setState(() {
                      this.sex = value;
                    });
                  })
            ],
          ),
        ),
        RadioListTile(
            title: Text("这是第一个选择"),
            subtitle: Text("man"),
            secondary: Icon(Icons.people_alt_rounded),
            value: 0,
            groupValue: this.sex,
            onChanged: (value) {
              this.setState(() {
                this.sex = value;
              });
            }),
        RadioListTile(
            title: Text("这是第二个选择"),
            subtitle: Text("female"),
            secondary: Icon(Icons.people_alt_rounded),
            value: 1,
            groupValue: this.sex,
            onChanged: (value) {
              this.setState(() {
                this.sex = value;
              });
            }),
        SwitchListTile(
            title: Text("同意共享用户信息"),
            subtitle: Text('分享的信息将帮助apple更好的改进产品'),
            secondary: Icon(Icons.info),
            value: this._choose,
            onChanged: (value) {
              this.setState(() {
                this._choose = value;
              });
            }),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: InkWell(
            onTap: () {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1999),
                      lastDate: DateTime(2030))
                  .then((value) => this.setState(() {
                        this._chooseTime = value ?? this._chooseTime;
                      }));
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                children: [
                  Text('生日：', style: TextStyle(fontSize: 20.0)),
                  Text(
                    formatDate(_chooseTime, [yyyy, '-', mm, '-', dd]),
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: InkWell(
            onTap: () {
              showTimePicker(
                      context: context,
                      initialTime: TimeOfDay(hour: 0, minute: 0))
                  .then((value) {
                this.setState(() {
                  _chooseTimeConcrete = value;
                });
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                children: [
                  Text('生日：', style: TextStyle(fontSize: 20.0)),
                  Text(
                    "${this._chooseTimeConcrete.format(context)}",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
