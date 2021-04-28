import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/friend.dart';
import 'package:flutter_application_1/pages/routes/Routes.dart';
import 'package:flutter_application_1/pages/setting.dart';

import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
      ),
      home: MyNavigationBar(),
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyNavigationBar extends StatefulWidget {
  final int index;
  final name;
  const MyNavigationBar({Key key, this.index = 0, this.name = 'Christopher'})
      : super(key: key);
  @override
  _MyNavigationBarState createState() =>
      _MyNavigationBarState(index: this.index);
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int index;
  List pageList = [HomePage(), friendPage(), SettingPage()];
  void initState() {
    super.initState();
    print(widget.name);
  }

  _MyNavigationBarState({this.index = 0});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: 70,
        width: 70,
        padding: EdgeInsets.all(3),
        margin: EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1020), color: Colors.white),
        child: FloatingActionButton(
          backgroundColor: Colors.yellow,
          onPressed: () {
            this.setState(() {
              index = 1;
            });
          },
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        centerTitle: true,
        title: Text('妖妖灵cartoon'),
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () => print("hah"),
        // ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => print("hah"),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => print("hah"),
          )
        ],
      ),
      body: pageList[index],
      drawer: MyDrawer(name: widget.name),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          this.setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "首页",
          ),
          BottomNavigationBarItem(
              icon: Icon(null), label: "发布", tooltip: "发布自己的闲置物品"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "设置",
          )
        ],
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  final name;
  const MyDrawer({
    Key key,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //添加侧边栏会自动放置menu
      child: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: UserAccountsDrawerHeader(
                    // otherAccountsPictures: [
                    //   CircleAvatar(
                    //     backgroundImage: NetworkImage(
                    //         "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ffile2.renrendoc.com%2Ffileroot_temp3%2F2021-3%2F22%2F6d6d4388-7021-4580-9c52-5676233033d2%2F6d6d4388-7021-4580-9c52-5676233033d23.gif&refer=http%3A%2F%2Ffile2.renrendoc.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1622019695&t=ef9df05866826adf6876ba9e3a5c2033"),
                    //   ),
                    //   CircleAvatar(
                    //     backgroundImage: NetworkImage(
                    //         "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ffile2.renrendoc.com%2Ffileroot_temp3%2F2021-3%2F22%2F6d6d4388-7021-4580-9c52-5676233033d2%2F6d6d4388-7021-4580-9c52-5676233033d23.gif&refer=http%3A%2F%2Ffile2.renrendoc.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1622019695&t=ef9df05866826adf6876ba9e3a5c2033"),
                    //   )
                    // ],
                    accountName: Text(this.name),
                    accountEmail: Text('1584537639@qq.com'),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ffile2.renrendoc.com%2Ffileroot_temp3%2F2021-3%2F22%2F6d6d4388-7021-4580-9c52-5676233033d2%2F6d6d4388-7021-4580-9c52-5676233033d23.gif&refer=http%3A%2F%2Ffile2.renrendoc.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1622019695&t=ef9df05866826adf6876ba9e3a5c2033"),
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fblog%2F202009%2F09%2F20200909174551_mNNtR.thumb.400_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1622019339&t=8ec13265b8fd44d130dd526d2c1137c4")))),
              ),
            ],
          ),
          SizedBox(height: 50.0),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/userCenter'),
            title: Text("个人中心"),
            leading: CircleAvatar(
              child: Icon(Icons.home),
            ),
          ),
          ListTile(
            title: Text("我的好友"),
            leading: CircleAvatar(
              child: Icon(Icons.people),
            ),
          ),
          ListTile(
            title: Text("系统设置"),
            leading: CircleAvatar(
              child: Icon(Icons.settings),
            ),
          ),
        ],
      ),
    );
  }
}

class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1087175815,1401428637&fm=26&gp=0.jpg"))),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(
                  "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3228549874,2173006364&fm=26&gp=0.jpg"),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Christopher",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            )
          ],
        ));
  }
}
