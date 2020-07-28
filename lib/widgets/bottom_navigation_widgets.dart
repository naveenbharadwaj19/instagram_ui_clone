import 'package:flutter/material.dart';

class BottomNavigationWidgets extends StatelessWidget {
  final int index;
  final Function tapped;

  BottomNavigationWidgets(this.index, this.tapped);

  _changeFavIconColor(Color white) {
    return BottomNavigationBarItem(
        backgroundColor: Colors.black,
        title: Text(""),
        icon: Icon(
          Icons.favorite,
          color: white,
          size: 33,
        ));
  }

  _changePersonIconColor(Color white) {
    return BottomNavigationBarItem(
        backgroundColor: Colors.black,
        title: Text(""),
        icon: Icon(
          Icons.person,
          color: white,
          size: 33,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final Color _white = Colors.white;
    return BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: index,
        onTap: tapped,
        backgroundColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey,
        selectedItemColor: _white,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              title: Text(""),
              icon: Icon(
                Icons.home,
                color: _white,
                size: 33,
              )),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              title: Text(""),
              icon: Icon(
                Icons.search,
                color: _white,
                size: 33,
              )),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              title: Text(""),
              icon: Icon(
                Icons.add_to_photos,
                color: _white,
                size: 33,
              )),
          index == 3
              ? _changeFavIconColor(_white)
              : BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  title: Text(""),
                  icon: Icon(
                    Icons.favorite_border,
                    color: _white,
                    size: 33,
                  )),
          index == 4
              ? _changePersonIconColor(_white)
              : BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  title: Text(""),
                  icon: Icon(
                    Icons.person_outline,
                    color: _white,
                    size: 33,
                  )),
        ]);
  }
}
