import 'package:flutter/cupertino.dart';

class AnimNavigator {
  AnimNavigator._();

  static push(context, Widget page) {
    return Navigator.push(
        context, CupertinoPageRoute(builder: (context) => page));
  }

  static replace(context, Widget page) {
    return Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => page));
  }

  static removeAndPush(context, Widget page) {
    return Navigator.pushAndRemoveUntil(context,
        CupertinoPageRoute(builder: (context) => page), (route) => false);
  }
}
