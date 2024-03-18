import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:thandri_sannidhi/components/neu_box.dart';
import 'package:thandri_sannidhi/mp3_songs/mp3_songs.dart';

class Mo3SongShowDetails extends StatefulWidget {
  final int index;

  const Mo3SongShowDetails({super.key, required this.index});

  @override
  State<Mo3SongShowDetails> createState() => _Mo3SongShowDetailsState();
}

class _Mo3SongShowDetailsState extends State<Mo3SongShowDetails> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }

  void prevSong() {}

  void nextSong() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 54, 1, 63),
        title: Text(mp3songs[widget.index].name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                NeuBox(
                  child: Image.asset(
                    "images/songs.jpg",
                    width: 300,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  mp3songs[widget.index].name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 54, 1, 63),
                    fontFamily: 'Sree',
                  ),
                ),
                Text(
                  mp3songs[widget.index].album,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 0),
                  ),
                  child: Slider(
                      value: position.inSeconds.toDouble(),
                      activeColor: const Color.fromARGB(255, 54, 1, 63),
                      inactiveColor: Colors.white,
                      thumbColor: const Color.fromARGB(255, 54, 1, 63),
                      min: 0,
                      max: duration.inSeconds.toDouble(),
                      onChanged: (value) async {
                        final position = Duration(
                          seconds: value.toInt(),
                        );
                        await audioPlayer.seek(position);

                        await audioPlayer.resume();
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () async {
                          if (isPlaying) {
                            await audioPlayer.pause();
                          } else {
                            await audioPlayer.play(UrlSource(
                              mp3songs[widget.index].link,
                            ));
                          }
                        },
                        child: NeuBox(
                          child: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            size: 20,
                            color: const Color.fromARGB(255, 54, 1, 63),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
