import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'dart:math';
import './Sound.dart';

class Noisebox extends StatefulWidget {
  @override
  NoiseboxState createState() => NoiseboxState();
}

class NoiseboxState extends State<Noisebox> {
  Color _color = Colors.green[100];
  String _category;
  final rnd = Random();
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  List<String> _categories = ['cat', 'dog', 'poop'];
  List<Sound> _activeSounds = [];

  _handleChanged(int value) {
    _category = _categories[value];
    setState(() {
      _activeSounds =
          sounds.where((sound) => sound.category.contains(_category)).toList();
      _color =
          _color == Colors.green[100] ? Colors.red[100] : Colors.green[100];
    });
  }

  _playAudio(String _file) {
    // String _asset = _file + '.wav';
    // print(_asset.toString());
    AssetsAudio _assetsAudio = AssetsAudio(asset: _file, folder: 'lib/audios/');
    _assetsAudioPlayer.open(_assetsAudio);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      color: _color,
      child: Scaffold(
        appBar: AppBar(
          title: DropdownButton(
              hint: Text('Explore [under development]'),
              items: [
                DropdownMenuItem(
                  child: Text('cat'),
                  value: 0,
                ),
                DropdownMenuItem(
                  child: Text('dog'),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text('poop'),
                  value: 2,
                ),
              ],
              onChanged: (value) => _handleChanged(value)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              Image.asset('lib/images/$_category.png',width: 100,),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: ListView.builder(
                    itemCount: _activeSounds.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.surround_sound),
                        title: Text(_activeSounds[index].noisepath),
                        onTap: () => _playAudio(_activeSounds[index].noisepath),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//activeSounds[rnd.nextInt(3)].noisepath
