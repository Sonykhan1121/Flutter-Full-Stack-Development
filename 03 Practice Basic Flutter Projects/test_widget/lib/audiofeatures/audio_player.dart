import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayerScreen extends StatefulWidget {
  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  double _currentSliderValue = 0.0;
  Duration _currentPosition = Duration.zero;
  Duration? _duration ;
  bool isPlaying = false;
  bool isLoading = false;

  final String audioUrl = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";

  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  Future<void> _initAudio() async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.music());

    setState(() => isLoading = true); // Show loading indicator

    try {
      await _audioPlayer.setUrl(audioUrl);
    } catch (e) {
      print("Error loading audio: $e");
    }

    setState(() => isLoading = false); // Hide loading indicator

    _audioPlayer.positionStream.listen((duration) {
      setState(() {
        _currentSliderValue = duration.inSeconds.toDouble();
        _currentPosition = duration;
        _duration = _audioPlayer.duration;
      });
    });
  }
  String formatDuration(Duration duration)
  {
    String twoDigits(int n) => n.toString().padLeft(2,'0');
    return "${twoDigits(duration.inHours)}:${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds)}";
  }

  void _playPauseAudio() async {


    if (!isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play();
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.pink, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: EdgeInsets.all(20),
              child: Icon(Icons.music_note, size: 60, color: Colors.white),
            ),

            SizedBox(height: 20),

            // Progress Bar
            Slider(
              value: _currentSliderValue,
              min: 0,
              max: _audioPlayer.duration?.inSeconds.toDouble() ?? 100,
              activeColor: Colors.purple,
              inactiveColor: Colors.purple.shade100,
              onChanged: (value) {
                _audioPlayer.seek(Duration(seconds: value.toInt()));
              },
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('running: ${formatDuration(_currentPosition)}'),
                Text("Total:${formatDuration(_duration!)}"),
              ],
            ),
            SizedBox(height:20),

            // Music Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.skip_previous, size: 40, color: Colors.purple),
                  onPressed: () {},
                ),

                isLoading
                    ? CircularProgressIndicator(color: Colors.purple) // Show Loader
                    : IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, size: 50, color: Colors.purple),
                  onPressed:(){
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                    _playPauseAudio();
                  } ,
                ),

                IconButton(
                  icon: Icon(Icons.skip_next, size: 40, color: Colors.purple),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
