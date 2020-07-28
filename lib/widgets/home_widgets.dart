import 'package:flutter/material.dart';
import 'package:instagram_ui_clone/customs/comment_icons.dart';
import 'package:instagram_ui_clone/customs/ig_send_icons.dart';
import 'package:instagram_ui_clone/data/ig_main_img.dart';
import 'package:instagram_ui_clone/data/postedtime.dart';
import 'package:instagram_ui_clone/data/select_fav.dart';
import 'package:instagram_ui_clone/data/story_data.dart';
import 'package:instagram_ui_clone/data/user_names.dart';

class HomeWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return ListView(
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        StoryWidgets(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.0),
          child: Container(
            height: 1.0,
            width: width,
            color: Colors.grey,
          ),
        ),
        MainHomeWidgets(),
      ],
    );
  }
}

class StoryWidgets extends StatelessWidget {
  void tapStory(int idx, List<String> img) {
    print("Tapping ${img[idx]}");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: storyImages.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 5),
            child: GestureDetector(
              onTap: () => tapStory(index, storyImages),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color(0xFF833AB4), // Purple
                    Color(0xFFF77737), // Orange
                    Color(0xFFE1306C), // Red-pink
                    Color(0xFFC13584), // Red-purple
                  ])
                ),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.transparent,
                  child: CircleAvatar(
                      radius: 35,
                      // backgroundColor: Colors.purple,
                      backgroundImage:
                          AssetImage("assets/images/${storyImages[index]}.jpg")),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MainHomeWidgets extends StatefulWidget {
  @override
  _MainHomeWidgetsState createState() => _MainHomeWidgetsState();
}

class _MainHomeWidgetsState extends State<MainHomeWidgets> {
  _viewPicutres(List<String> picViews, int idx) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: InkWell(
        onDoubleTap: () {
          setState(() {
            if (activateFav[idx] == activateFav[idx]) {
              activateFav[idx] = true;
            }
          });
        },
        child: Image.asset(
          "assets/images/${picViews[idx]}.jpg",
          fit: BoxFit.cover,
          height: 220,
          width: double.infinity,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height -250;
    print(height);
    return SizedBox(
        height: height,
        child: ListView.builder(
            itemCount: usernames.length,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 5, top: 5),
                height: 370,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    color: Colors.black),
                child: Stack(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                          // backgroundColor: Colors.red,
                          backgroundImage: AssetImage(
                              "assets/images/${storyImages[index]}.jpg"),
                          radius: 20,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 5)),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 10, left: 7),
                        child: Text(usernames[index].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(top: 5),
                    child: GestureDetector(
                        onTap: () {
                          print("clicking more vert");
                        },
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        )),
                  ),
                  _viewPicutres(igMainImg, index),
                  Container(
                    margin: EdgeInsets.only(top: 220),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (activateFav[index] == true) {
                                    activateFav[index] = false;
                                  } else if (activateFav[index] == false) {
                                    activateFav[index] = true;
                                  }
                                });
                              },
                              child: Icon(
                                activateFav[index]
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 33,
                                color: activateFav[index]
                                    ? Colors.red
                                    : Colors.white,
                              )),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          GestureDetector(
                              onTap: (){ print("clicking comment");},
                              child: Icon(
                                Comment.comment_empty,
                                size: 33,
                                color: Colors.white,
                              )),
                          Padding(padding: EdgeInsets.only(left: 13)),
                          GestureDetector(
                              onTap: (){ print("clicking dm icon");},
                              child: Icon(
                                IgSend.paper_plane,
                                size: 28,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 220),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.bookmark_border,
                          size: 33,
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom:10),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(postedTime[index].toString(),style:TextStyle(color: Colors.grey))
                    ),
                  ),
                ] //Stack,
                    ),
              );
            }));
  }
}
