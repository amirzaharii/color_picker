import 'package:day7/listItem.dart';
import 'package:flutter/material.dart';

class Shades extends StatelessWidget {
  Shades({required this.color});

  final MaterialAccentColor color;

  @override
  Widget build(BuildContext context) {
    final List<Color> accentShades = [
      color.shade100,
      color.shade200,
      color.shade400,
      color.shade700
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Shades Page'),
        backgroundColor: color,
      ),
      body: ListView.builder(
        itemCount: accentShades.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ListItem(
                color: accentShades[index],
              ),
            ],
          );
        },
      ),
    );
  }
}
