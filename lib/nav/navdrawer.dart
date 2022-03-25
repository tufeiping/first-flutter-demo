import "package:flutter/material.dart";

import '../utils/index.dart';

final String AvatarUrl =
    "https://static.diwork.com/81718/2877373/201903/10/1552259839c787830c533876896d0a33d34c17f946.jpg";

/**
 * 测试侧边栏公共组件
 */
class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ClipOval(
                child: Image.asset("assets/thumb.png"),
              ),
              // GFAvatar(
              //   // backgroundImage: NetworkImage(AvatarUrl),
              //   backgroundImage: Image.asset("asset/thumb.jpg"),
              // ),
            ),
            Padding(
              padding: EdgeInsets.zero,
              child: GestureDetector(
                  child: Text("欢迎 Sunny"),
                  onTap: () {
                    showAlert(
                        context, "用户信息", "Name: Sunny\nSex: Female\nAge:45");
                  }),
            ),
          ],
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Messages'),
          onTap: () {
            showAlert(context, "新闻",
                "据“3·21”东航MU5735航空器飞行事故国家应急处置指挥部第三场新闻发布会消息，经过现场搜救武警官兵和事故调查人员的共同努力，23日16时30分左右，在事故现场主要撞击点东南方向约30米处的表层泥土中发现了两部飞行记录器（黑匣子）中的一部，现场调查人员对记录器进行了初步检查，记录器外观破损严重，但存储单元外观相对较为完好，初步判定为驾驶舱话音记录器（CVR）。");
          },
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {},
        ),
      ]),
      Positioned(
        bottom: 10,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: Row(children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                child: Icon(Icons.west),
              ),
              Text("Logout"),
            ]),
            onTap: () {
              showAlert(context, "退出", "退出系统");
            },
          ),
        ),
      ),
    ]);
  }
}
