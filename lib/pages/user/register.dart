import 'package:flutter/material.dart';

import '../../main.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key, this.arguments}) : super(key: key);
  final arguments;
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('下一步'),
          onPressed: () {
            // //替换路由
            // Navigator.of(context).pushReplacementNamed('/registerSecond');
            Navigator.pushNamed(context, '/registerSecond');
          },
        ),
      ),
    );
  }
}

//这是注册的第二个页面
class RegisterPageSecond extends StatefulWidget {
  @override
  _RegisterPageSecondState createState() => _RegisterPageSecondState();
}

class _RegisterPageSecondState extends State<RegisterPageSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('完成'),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => MyNavigationBar(
                          index: 2,
                        )),
                (route) => false);
          },
        ),
      ),
    );
  }
}
