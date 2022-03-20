import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

// Membuat class Myapp yg merupakan turunan dari kelas StatelessWidget
// cukup ketikan stl

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random(); // Add this line.
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: RandomWords(),
    );
  }
}

// Membuat class RandomWords yg merupakan turunan dari kelas StatefulWidget
class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[]; // NEW
  final _biggerFont = const TextStyle(fontSize: 40); // NEW

  @override
  Widget build(BuildContext context) {
    // final wordPair =
    //     WordPair.random(); // Membuat object yang menyimpan kata acak
    // return Text(
    //     wordPair.asPascalCase); // Mengembalikan widget Text dengan kata acak

    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, i) {
        if (i.isEven) {
          return const Divider(); // memberikan garis pembatas jika i berjumlah genap
        }
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: GoogleFonts.lato(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
