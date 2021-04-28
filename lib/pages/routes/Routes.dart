import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/user/login.dart';
import 'package:flutter_application_1/pages/user/register.dart';
import 'package:flutter_application_1/pages/user/userCenter.dart';

import '../../main.dart';
import '../Search.dart';

// ignore: slash_for_doc_comments
/**
 * 配置路由的地方
 */
final routes = {
  '/search': (context, {arguments}) => SearchPage(arguments: arguments),
  '/register': (context, {arguments}) => RegisterPage(arguments: arguments),
  '/login': (context, {arguments}) => LoginPage(arguments: arguments),
  '/registerSecond': (context, {arguments}) => RegisterPageSecond(),
  '/': (context, {arguments}) => MyNavigationBar(name: arguments),
  '/userCenter': (context) => UserCenter(),
};

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  } else
    return null;
}
