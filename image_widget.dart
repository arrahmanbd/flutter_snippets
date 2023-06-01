import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart'
    show kTransparentImage;

class ImageExample extends StatelessWidget {
  const ImageExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ListTile(title: Text('Image from asset:')),
        Card(
          child: Image.asset('res/images/dart-side.png'),
        ),
        Divider(),
        ListTile(title: Text('Cached network image:')),
        CachedNetworkImage(
          imageUrl: 'https://picsum.photos/id/7/250/250',
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Divider(),
        ListTile(title: Text('GIF from asset:')),
        Image.asset(
          'res/images/animated_flutter_lgtm.gif',
          scale: 1.0,
          height: 300,
        ),
      ],
    );
  }
}
