import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'dart:math';
import './Sound.dart';

class Homebox extends StatefulWidget {
  @override
  HomeboxState createState() => HomeboxState();
}

class HomeboxState extends State<Homebox> {
  String _title = "NoisyBox";
  Color _bgColor = Colors.blueGrey;
  int _value;
  final rnd = Random();
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  String _imageasset = 'lib/images/cat.png';
  List<String> _categories = ['cat', 'dog', 'llama', 'poop'];
  List<Sound> _activeSounds = [cat1, cat2, cat3];

  void _handleCategory(value) {
    String _category = _categories[value];
    _value = value;
    _imageasset = 'lib/images/$_category.png';
    _activeSounds = sounds
        .where((sound) => sound.category.contains(_categories[value]))
        .toList();
    _bgColor = _bgColor == Colors.blueGrey ? Colors.cyan : Colors.blueGrey;
    setState(() {});
    String _message = _category != 'poop' ? 'Click Me!' : 'Gross dude...';
    _showSnackBar(context, _message);
  }

  _playAudio(String _file) {
    AssetsAudio _assetsAudio = AssetsAudio(asset: _file, folder: 'lib/audios/');
    _assetsAudioPlayer.open(_assetsAudio);
  }

  _showSnackBar(context, _message) {
    var sb = SnackBar(
      content: Text(_message, style: TextStyle(color: Colors.pink,fontSize: 25),),
      duration: Duration(milliseconds: 1500),
    );
    Scaffold.of(context).showSnackBar(sb);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(_title),
                DropdownButton(
                  value: _value,
                  hint: Text('More sounds'),
                  items: [
                    DropdownMenuItem(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.arrow_right),
                          Text('Cat')
                        ],
                      ),
                      value: 0,
                    ),
                    DropdownMenuItem(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.arrow_right),
                          Text('Dog'),
                        ],
                      ),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.arrow_right),
                          Text('Llama'),
                        ],
                      ),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.arrow_right),
                          Text('Poop'),
                        ],
                      ),
                      value: 3,
                    ),
                  ],
                  onChanged: (value) => _handleCategory(value),
                )
              ],
            )),
        body: Center(
            child: AnimatedContainer(
                height: MediaQuery.of(context).size.height * 2,
                padding: EdgeInsets.all(100),
                duration: Duration(milliseconds: 300),
                color: _bgColor,
                child: GestureDetector(
                    child: Image.asset(
                      _imageasset,
                    ),
                    onTap: () =>
                        _playAudio(_activeSounds[rnd.nextInt(3)].noisepath)))));
  }
}
