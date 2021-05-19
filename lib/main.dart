import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'appWidget.dart';

Map<WordPair, bool> wordPairs;

void main() {
  initWordPairs();
  runApp(App());
}
