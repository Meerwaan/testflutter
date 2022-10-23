import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'CiguEuro',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bienvenue dans CiguEuro'),
        ),
        body:  Center(
          child: Text(wordPair.asPascalCase),
        ),
      ),
    );
  }
}
