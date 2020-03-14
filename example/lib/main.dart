import 'package:flutter/material.dart';
import 'package:web_image/web_image.dart';

void main() => runApp(MyApp());

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        radius: 30,
        backgroundImage: WebImage(
          NetworkImage("https://cdn.tuoitre.vn/thumb_w/586/2019/5/8/avatar-publicitystill-h2019-1557284559744252594756.jpg"),
          placeholder: AssetImage("assets/avatar-default-md.png"),
//          error: AssetImage("assets/avatar-default-md.png"),
        ),
      ),
    );
  }
}
