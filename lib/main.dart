import 'package:flutter/material.dart';
import 'package:instagram_ui_clone/screens/camera_screen.dart';
import 'package:instagram_ui_clone/screens/fav_screen.dart';
import 'package:instagram_ui_clone/screens/home_screen.dart';
import 'package:instagram_ui_clone/screens/profile_screen.dart';
import 'package:instagram_ui_clone/screens/search_screen.dart';
import 'package:instagram_ui_clone/widgets/bottom_navigation_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _widgetsScreenTapped = [HomeScreen(),SearchScreen(),CameraScreen(),FavouriteScreen(),ProfileScreen()];
  int index = 0;
  tapped(int idx){
    setState(() {
      index = idx;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetsScreenTapped[index],
      bottomNavigationBar: BottomNavigationWidgets(index,tapped),
    );
  }
}