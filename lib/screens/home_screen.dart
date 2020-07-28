import 'package:flutter/material.dart';
import 'package:instagram_ui_clone/customs/ig_send_icons.dart';
import 'package:instagram_ui_clone/widgets/home_widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "𝓘𝓷𝓼𝓽𝓪𝓰𝓻𝓪𝓶",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        leading: FlatButton(
            onPressed: () {},
            child: Icon(
              Icons.photo_camera,
              color: Colors.white,
              size: 25,
            ),
          ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Icon(
              IgSend.paper_plane,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
      body: HomeWidgets(),
    );
  }
}