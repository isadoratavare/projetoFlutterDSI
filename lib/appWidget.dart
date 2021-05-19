import 'package:dsi_app/homePage.dart';
import 'package:dsi_app/main.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void initWordPairs() {
  final generatedWordPairs = generateWordPairs().take(3);
  wordPairs = Map.fromIterable(generatedWordPairs, key: (e) => e, value: (e) => null);
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Listagem - DSI/BSI/UFRPE',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
