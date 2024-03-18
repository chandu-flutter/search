import 'package:flutter/material.dart';
import 'package:thandri_sannidhi/song_lyrics/song.dart';

class ShowDetails extends StatefulWidget {
  final int index;

  const ShowDetails({super.key, required this.index});

  @override
  State<ShowDetails> createState() => _ShowDetailsState();
}

class _ShowDetailsState extends State<ShowDetails> {
  double _initialScale = 1.0;
  double _scaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 54, 1, 63),
        title: Text(songs[widget.index].name),
        centerTitle: true,
      ),
      body: GestureDetector(
        onScaleStart: (details) {
          _initialScale = _scaleFactor;
        },
        onScaleUpdate: (details) {
          setState(() {
            _scaleFactor = _initialScale * details.scale;
            print(_scaleFactor);
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  songs[widget.index].details,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'rama',
                  ),
                  textScaleFactor: _scaleFactor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
