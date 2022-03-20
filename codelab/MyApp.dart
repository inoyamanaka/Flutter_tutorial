import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

// Membuat class Myapp yg merupakan turunan dari kelas StatelessWidget
// cukup ketikan stl
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        // ini untuk mengatur font style
        textTheme: GoogleFonts.pacificoTextTheme(),

        // Mengatur Theme untuk warna background dan text serta menengahkan text
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 132, 248, 238),
          foregroundColor: Colors.black,
        ),
      ),

      // Menampilkan halaman home
      home: RandomWords(),
    );
  }
}

// Membuat class RandomWords yg merupakan turunan dari kelas StatefulWidget
// cukup ketikan stfu
class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

// Membuat class _RandomWordsState yg merupakan turunan dari kelas State
class _RandomWordsState extends State<RandomWords> {
  // Membuat list untuk menampung kata-kata yang telah di generate
  final _suggestions = <WordPair>[]; // NEW

  // Membuat set untuk menampung kata-kata yang telah disimpan
  final _saved = <WordPair>{};

  // Membuat construktor
  @override
  Widget build(BuildContext context) {
    void _pushSaved() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          // Membuat tampilan baru untuk menampilkan daftar kata-kata yang telah disimpan
          builder: (BuildContext context) {
            final tiles = _saved.map(
              (WordPair pair) {
                return ListTile(
                  title: Text(
                    pair.asPascalCase,
                    style: TextStyle(fontSize: 18),
                  ),
                );
              },
            );

            // Membuat tampilan baru untuk menampilkan daftar kata-kata yang telah disimpan
            final divided = ListTile.divideTiles(
              context: context,
              tiles: tiles,
            ).toList();

            // Mengembalikan tampilan baru
            return Scaffold(
              appBar: AppBar(
                title: Text('Saved Suggestions'),
              ),
              body: ListView(children: divided),
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
            tooltip: 'Saved Suggestions',
          ),
        ],
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

// Membuat widget untuk menambahkan kata-kata ke dalam list
  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic),
      ),

      // Menambahkan icon love sebagai tanda bahwa kata-kata sudah disimpan
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
        semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
      ),

      // Mengatur aksi ketika icon di klik
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}


// 1. MyApp
// 2. RandomWords
//    pada RandomWords mempunyai kelas warisan yaitu _RandomWordsState.
//    Di dalam _RandomWordsState terdapat widget _buildSuggestions(), buildRow() dan build()
//    Di dalam build() terdapat function _pushSaved()
