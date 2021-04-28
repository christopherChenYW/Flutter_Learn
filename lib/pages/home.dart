import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  List<Widget> list = [];
  List _swiperList = [];
  @override
  void initState() {
    // TODO: implement initState
    _swiperList.add(Image.network(
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2F05.imgmini.eastday.com%2Fmobile%2F20180214%2F20180214110020_8fef153db74bb8696becea858574d33f_1.gif&refer=http%3A%2F%2F05.imgmini.eastday.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1622095542&t=727c58b9745dd445cc49ce5ccbc140f5",
      fit: BoxFit.cover,
    ));
    _swiperList.add(Image.network(
      "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=154375775,3535645388&fm=26&gp=0.jpg",
      fit: BoxFit.cover,
    ));
    _swiperList.add(Image.network(
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201703%2F17%2F20170317105527_vSfcK.thumb.700_0.gif&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1622094884&t=e352763a978cfbbb9033df80360dba9e",
      fit: BoxFit.cover,
    ));
    list.add(
      Container(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Swiper(
            duration: 1000,
            autoplay: true,
            itemBuilder: (BuildContext context, int index) {
              return _swiperList[index];
            },
            itemCount: 3,
            pagination: new SwiperPagination(alignment: Alignment.bottomRight),
            // control: new SwiperControl(),
            itemWidth: 500.0,
            layout: SwiperLayout.STACK,
          ),
        ),
      ),
    );
    list.add(SizedBox(height: 10));
    for (int i = 0; i < 20; i++) {
      list.add(InkWell(
        onTap: () async {
          var result = await showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return AlertDialog(
                  title: Text("不准点!!!!!"),
                  content: Text("为什么要叫我起床呢????"),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, '叼毛');
                        },
                        child: Text("叼毛")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, '大叼毛');
                        },
                        child: Text("大叼毛")),
                  ],
                );
              });
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => MyNavigationBar(
                        index: 0,
                        name: result,
                      )),
              (route) => false);
        },
        child: Card(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  "https://i0.hdslb.com/bfs/live/7218331694b26556ac37fdca5c2c435e3e2fb398.png@640w_660h_1c_100q.webp",
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                title: Text("原神"),
                subtitle: Text(
                  "这是一款无聊的游戏ksajf kdsjafldjf djakfdsfa jajfakds this is my favorite song this is my facorite this is m skf sjdkf jdskfskdf ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://i0.hdslb.com/bfs/live/7218331694b26556ac37fdca5c2c435e3e2fb398.png@640w_660h_1c_100q.webp"),
                ),
              ),
            ],
          ),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: list,
    );
  }
}
