import 'package:flutter/material.dart';

class GridViewer extends StatefulWidget {
  @override
  _GridViewerState createState() => _GridViewerState();
}

class _GridViewerState extends State<GridViewer> {
  List<Image> images = [
    Image.asset('lib/images/cat.png'),
    Image.asset('lib/images/dog.png'),
    Image.asset('lib/images/llama.png'),
    Image.asset('lib/images/poop.png')
  ];
  @override
  Widget build(BuildContext context) {
    return Hero(tag: 'HeroGrid',
          child: GridView.builder(
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
        itemBuilder: (BuildContext context, index) {
          return ListTile(title: images[index],);
        },
      ),
    );
  }
}
