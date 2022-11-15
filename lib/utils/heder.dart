import 'package:flutter/material.dart';

AppBar header(
  context, {
  bool isAppTitle = false,
  String? titleText,
}) {
  return AppBar(
    title: Text(
      isAppTitle ? 'SocialApp' : titleText!,
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontFamily: 'Signatra',
      ),
      overflow: TextOverflow.ellipsis,
    ),
    centerTitle: true,
    backgroundColor: Colors.teal,
  );
}
