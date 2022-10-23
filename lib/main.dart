import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'CiguEuro',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amberAccent,
          foregroundColor: Colors.black,
        )
      ),
      home: const RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerfont = const TextStyle(fontSize: 20);
  void _pushSaved(){
    Navigator.of(context).push(
      // Add lines from here...
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerfont,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ), 
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(  
        title: const Text('Name Generator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
            tooltip: 'Saved Suggestions',
          ),
        ],
      ),          
      body: ListView.builder(
      padding: const EdgeInsets.all(20.0),
      itemBuilder: (context, i) {
        /*Le item builder est rappeler a chaque ligne*/
        if (i.isOdd)
          return const Divider(); /* Divider sert aseparer chaque ligne*/

        final index = i ~/
            2; /*C'est pour dire que quand tu divise par  ca renvoit toujours un entier ex 7/2 = 3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        final alreadySaved = _saved.contains(_suggestions[index]);
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerfont,
          ),
          trailing: Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
            semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
          ),
          onTap: () {
            if (alreadySaved) {
              _saved.remove(_suggestions[index]);
            } else {
              _saved.add(_suggestions[index]);
            }
          },
        );
      },
    ));
  }
}
