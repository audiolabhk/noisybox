import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'dart:math';
import './Sound.dart';

class Homebox extends StatefulWidget {
  @override
  HomeboxState createState() => HomeboxState();
}

class HomeboxState extends State<Homebox> {
  bool _firstState = true;
  String _title = "NoisyBox";
  Color _bgColor = Colors.blueGrey;
  final rnd = Random();
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  String _imageasset = 'lib/images/cat.png';
  List<String> _categories = ['cat', 'dog', 'llama', 'poop'];
  List<Sound> _activeSounds = [cat1, cat2, cat3];

  void _handleCategory(value) {
    String _category = _categories[value];
    _imageasset = 'lib/images/$_category.png';
    _activeSounds = sounds
        .where((sound) => sound.category.contains(_categories[value]))
        .toList();
    _bgColor = Color((rnd.nextDouble() * 0xFFF).toInt() << 0).withOpacity(1.0);
    _firstState = !_firstState;
    setState(() {});
  }

  _playAudio(String _file) {
    AssetsAudio _assetsAudio = AssetsAudio(asset: _file, folder: 'lib/audios/');
    _assetsAudioPlayer.open(_assetsAudio);
  }

  void _handleSwap(){
    setState(() {
      _bgColor = Color((rnd.nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
      _firstState = !_firstState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(_title)),
      body: Center(
          child: AnimatedContainer(
              height: MediaQuery.of(context).size.height * 2,
              padding: EdgeInsets.all(100),
              duration: Duration(milliseconds: 300),
              color: _bgColor,
              child: AnimatedCrossFade(
                duration: Duration(milliseconds: 500),
                crossFadeState: _firstState ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                firstChild: GestureDetector(
                    child: Image.asset(
                      _imageasset,
                    ),
                    onTap: () =>
                        _playAudio(_activeSounds[rnd.nextInt(3)].noisepath)),
              secondChild: Center(
                child: GridView.builder(
        itemCount: _categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
        itemBuilder: (BuildContext context, index) {
          return ListTile(title: Image.asset('lib/images/'+_categories[index]+'.png'),
          onTap: () => _handleCategory(index),

          );
        },
      ),
              ),
              ))),
      floatingActionButton: FloatingActionButton(
        child: _firstState ? Icon(Icons.open_in_new) : Icon(Icons.backspace),
        onPressed: () => _handleSwap(),
      ),
    );
  }
}
