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
          title: const Text('Name Generator'),
        ),
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerfont = const TextStyle(fontSize: 20);

  @override
Widget build(BuildContext context) {
  return ListView.builder(
    padding: const EdgeInsets.all(20.0),
    itemBuilder:  (context, i) { /*Le item builder est rappeler a chaque ligne*/
      if (i.isOdd) return const Divider(); /* Divider sert aseparer chaque ligne*/

      final index = i ~/ 2; /*C'est pour dire que quand tu divise par  ca renvoit toujours un entier ex 7/2 = 3*/
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10)); 
      }
      return ListTile(
        title: Text(
          _suggestions[index].asPascalCase,
          style: _biggerfont,
        ),
      );
    },
  );
}
}
