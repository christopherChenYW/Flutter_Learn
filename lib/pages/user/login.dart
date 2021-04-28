import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final arguments;

  const LoginPage({Key key, this.arguments}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _tabController,
            isScrollable: false, //当按钮过多的时候可以滑动
            tabs: [
              Tab(
                text: "热门",
              ),
              Tab(
                text: "推荐",
              ),
              Tab(
                text: "爆款",
              ),
            ],
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          title: Text('登陆'),
        ),
        body: TabBarView(controller: _tabController, children: [
          Center(
            child: ElevatedButton(
              child: Text('返回'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          ListView(
            children: [
              ListTile(
                title: Text("第一个死掉的"),
              ),
              ListTile(
                title: Text("第一个死掉的"),
              )
            ],
          ),
          ListView(
            children: [
              ListTile(
                title: Text("第而个死掉的"),
              ),
              ListTile(
                title: Text("第三个死掉的"),
              )
            ],
          )
        ]),
      ),
    );
  }
}
