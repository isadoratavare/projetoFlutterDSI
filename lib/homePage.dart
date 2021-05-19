import 'package:dsi_app/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:dsi_app/randomWordList.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myControl = TextEditingController();
  int pageIndex = 0;
  List<Widget> _pages = [
    RandomWordsListPage(null),
    RandomWordsListPage(true),
    RandomWordsListPage(false)
  ];

  void _changePage(int value) {
    setState(() {
      pageIndex = value;
    });
  }

  void _pesquisa(text) {
    print(text);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => searchPage(text)));
  }

  @override
  Widget build(BuildContext context) {
    var textField = new TextField(
      controller: myControl,
      decoration: new InputDecoration(
        hintText: 'Search...',
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: textField,
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            _pesquisa(myControl.value.text);
          },
        ),
      ),
      body: _pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _changePage,
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up_outlined),
            label: 'Liked',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_down_outlined),
            label: 'Disliked',
          ),
        ],
      ),
    );
  }
}
