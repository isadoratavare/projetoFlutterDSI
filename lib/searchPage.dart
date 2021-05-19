import 'package:dsi_app/main.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class searchPage extends StatefulWidget {
  final String text;
  searchPage(this.text);

  @override
  _searchPageState createState() => _searchPageState();
}

_pesquisa(text) {
  if (text != '') {
    text = text.toString();
    text = text.toLowerCase();
    text = text.split(' ');
    text = WordPair(text[0], text[1]);
    final list = wordPairs.entries
        .where((element) => element.key == text)
        .map((e) => e.key)
        .toList();
    if (list.length != 0) {
      final _icons = {
        null: Icon(Icons.thumbs_up_down_outlined),
        true: Icon(Icons.thumb_up, color: Colors.blue),
        false: Icon(Icons.thumb_down, color: Colors.red),
      };
      return Column(
        children: [
          Text(list[0].first.toString() + ' ' + list[0].second.toString()),
          _icons[wordPairs[list[0]]]
        ],
      );
    } else {
      return Text('Palavra não encontrada');
    }
  } else {
    print('texto vazio');
    return Text('texto vazio');
  }
}

class _searchPageState extends State<searchPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.text);
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado da pesquisa'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_pesquisa(widget.text)],
        ),
      ),
    );
  }
}
