import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'pageEdit.dart';
import 'package:dsi_app/main.dart';

class RandomWordsListPage extends StatefulWidget {
  final bool _filter;
  RandomWordsListPage(this._filter);

  @override
  _RandomWordsListPageState createState() => _RandomWordsListPageState();
}

class _RandomWordsListPageState extends State<RandomWordsListPage> {
  List listWordPairs = wordPairs.keys.toList();
  List lista = wordPairs.keys.toList();
  final _icons = {
    null: Icon(Icons.thumbs_up_down_outlined),
    true: Icon(Icons.thumb_up, color: Colors.blue),
    false: Icon(Icons.thumb_down, color: Colors.red),
  };

  Iterable<WordPair> get items {
    if (widget._filter == null) {
      listWordPairs = lista;
      return wordPairs.keys;
    } else {
      listWordPairs = wordPairs.entries
          .where((element) => element.value == widget._filter)
          .map((e) => e.key)
          .toList();
      return wordPairs.entries
          .where((element) => element.value == widget._filter)
          .map((e) => e.key);
    }
  }

  _toggle(WordPair wordPair) {
    bool like = wordPairs[wordPair];
    if (widget._filter != null) {
      wordPairs[wordPair] = null;
    } else if (like == null) {
      wordPairs[wordPair] = true;
    } else if (like == true) {
      wordPairs[wordPair] = false;
    } else {
      wordPairs[wordPair] = null;
    }

    setState(() {});
  }

  String capitalize(String s) {
    return '${s[0].toUpperCase()}${s.substring(1)}';
  }

  String asString(WordPair wordPair) {
    return '${capitalize(wordPair.first)} ${capitalize(wordPair.second)}';
  }

  void remover(wordPair) {
    wordPairs.remove(wordPair);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length * 2,
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return Divider();
          }
          final int index = i ~/ 2;
          return _buildRow(index + 1, listWordPairs[index]);
        });
  }

  Widget _buildRow(int index, WordPair wordPair) {
    String parPalavras = '$index. ${asString(wordPair)}';
    return Dismissible(
        child: ListTile(
          title: Text(parPalavras),
          onTap: () {
            _pageEdit(context, wordPair, index);
          },
          trailing: IconButton(
            icon: _icons[wordPairs[wordPair]],
            onPressed: () => _toggle(wordPair),
          ),
        ),
        key: Key(wordPair.asLowerCase),
        background: Container(
          child: Text('Excluir'),
          color: Colors.redAccent,
        ),
        onDismissed: (direction) {
          remover(wordPair);
        });
  }

  _pageEdit(BuildContext context, WordPair wordPair, int index) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => pageEdit(wordPair)));
    final nova = new WordPair(result[0], result[1]);
    wordPairs[nova] = wordPairs[wordPair];
    setState(() {
      lista[index - 1] = nova;
      listWordPairs[index - 1] = nova;
      remover(wordPair);
    });
  }
}
