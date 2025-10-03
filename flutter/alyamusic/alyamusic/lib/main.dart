import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(AlyaMusicApp());
}

class AlyaMusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Alya Favorite Music",
      home: DNAPage(),
    );
  }
}

class DNAPage extends StatefulWidget {
  @override
  _DNAPageState createState() => _DNAPageState();
}

class _DNAPageState extends State<DNAPage> {
  final AudioPlayer _player = AudioPlayer();
  int _currentLine = 0;

  final List<Map<String, dynamic>> _lyrics = [
    {"time": 0, "text": "My reputation says that I fall too fast"},
    {"time": 5, "text": "They try to twist it, try to make it sound bad"},
    {"time": 10, "text": "But I don't care, no, I don't care"},
    {"time": 15, "text": "I've broke some hearts and had my heart broken too"},
    {"time": 20, "text": "And that's the risk I took when I fell for you"},
    {"time": 26, "text": "But I don't care, no, I don't care"},
    {"time": 31, "text": "This is just the way I am"},
    {"time": 36, "text": "Sorry I call again when you don't pick up"},
    {"time": 41, "text": "And tell you you're beautiful but probably too much"},
    {"time": 46, "text": "I tried, but I can't treat ya like the rest of L.A."},
    {"time": 52, "text": "Oh, it's just not in my DNA"},
    {"time": 57, "text": "To love you only halfway"},
    {"time": 62, "text": "I wanna hold your hand in front of my friends"},
    {"time": 67, "text": "Say what I'm feelin' and not have to pretend"},
    {"time": 73, "text": "That I don't care, no, I don't care"},
    {"time": 78, "text": "I wanna brag about you when you're not around"},
    {
      "time": 83,
      "text": "Hear you name next to mine 'cause I like the way it sounds",
    },
    {"time": 88, "text": "I'm sorry I call again when you don't pick up"},
    {
      "time": 93,
      "text": "And tell you you're beautiful but probably too much (too much)",
    },
    {"time": 99, "text": "I tried, but I can't treat ya like the rest of L.A."},
    {"time": 104, "text": "Oh, it's just not in my DNA"},
    {"time": 109, "text": "To love you only halfway"},
    {"time": 114, "text": "Love you only halfway"},
    {"time": 119, "text": "Love you only halfway"},
    {"time": 125, "text": "Love you only halfway"},
    {"time": 130, "text": "This is just way I am"},
    {"time": 135, "text": "I'm sorry I call again when you don't pick up"},
    {
      "time": 140,
      "text": "And tell you you're beautiful but probably too much",
    },
    {
      "time": 146,
      "text": "I tried, but I can't treat ya like the rest of L.A.",
    },
    {"time": 151, "text": "Oh, it's just not in my DNA"},
    {"time": 156, "text": "To love you only halfway"},
    {"time": 161, "text": "Love you only halfway"},
    {"time": 166, "text": "Love you only halfway"},
    {"time": 172, "text": "Love you only halfway"},
  ];

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    await _player.setAsset("assets/audio/dna.mp3");

    // Dengarkan posisi audio
    _player.positionStream.listen((position) {
      int seconds = position.inSeconds;

      for (int i = 0; i < _lyrics.length; i++) {
        if (seconds >= _lyrics[i]["time"]) {
          setState(() {
            _currentLine = i;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade300,
              Colors.purple.shade200,
              Colors.pink.shade100,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                "LANY - DNA",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 30),

              // Lirik
              Expanded(
                child: ListView.builder(
                  itemCount: _lyrics.length,
                  itemBuilder: (context, index) {
                    return AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 400),
                      style: TextStyle(
                        fontSize: index == _currentLine ? 24 : 18,
                        fontWeight: index == _currentLine
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: index == _currentLine
                            ? Colors.white
                            : Colors.white70,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6.0,
                          horizontal: 16,
                        ),
                        child: Text(
                          _lyrics[index]["text"],
                          textAlign: TextAlign.right, //Rata kanan
                        ),
                      ),
                    );
                  },
                ),
              ),

              // play/pause
              StreamBuilder<Duration>(
                stream: _player.positionStream,
                builder: (context, snapshot) {
                  final position = snapshot.data ?? Duration.zero;
                  final total = _player.duration ?? Duration.zero;

                  return Column(
                    children: [
                      Slider(
                        min: 0,
                        max: total.inSeconds.toDouble(),
                        value: position.inSeconds
                            .clamp(0, total.inSeconds)
                            .toDouble(),
                        activeColor: Colors.white,
                        inactiveColor: Colors.white54,
                        onChanged: (value) {
                          _player.seek(Duration(seconds: value.toInt()));
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: StreamBuilder<PlayerState>(
                              stream: _player.playerStateStream,
                              builder: (context, snapshot) {
                                final state = snapshot.data;
                                final playing = state?.playing ?? false;

                                if (playing) {
                                  return Icon(
                                    Icons.pause_circle_filled,
                                    size: 56,
                                    color: Colors.white,
                                  );
                                } else {
                                  return Icon(
                                    Icons.play_circle_filled,
                                    size: 56,
                                    color: Colors.white,
                                  );
                                }
                              },
                            ),
                            onPressed: () {
                              if (_player.playing) {
                                _player.pause();
                              } else {
                                _player.play();
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
