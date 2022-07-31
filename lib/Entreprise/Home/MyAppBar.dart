import 'package:flutter/material.dart';

class MyAppBarEntreprise extends StatelessWidget {
  String title;

  MyAppBarEntreprise({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff000000),
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.comment),
          tooltip: 'Comment Icon',
          onPressed: () {},
        ), //IconButton
        IconButton(
          icon: const Icon(Icons.settings),
          tooltip: 'Setting Icon',
          onPressed: () {},
        ), //IconButton
      ],
      leading: IconButton(
        icon: const Icon(Icons.menu),
        tooltip: 'Menu Icon',
        onPressed: () {},
      ),
    );
  }
}
