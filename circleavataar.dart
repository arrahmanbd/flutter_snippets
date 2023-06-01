import 'package:flutter/material.dart';

class Circleavtaar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _userAvatarUrl =
        'https://images.unsplash.com/photo-1565898835704-3d6be4a2c98c?fit=crop&w=200&q=60';

    return Center(
        child: CircleAvatar(
      backgroundImage: NetworkImage(_userAvatarUrl),
    ));
  }
}
