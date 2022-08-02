import 'package:day7/color_picker.dart';
import 'package:day7/listItem.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);

  void navigateToShadesStatic(BuildContext context, MaterialAccentColor color) {
    Navigator.pushNamed(context, '/shades', arguments: color);
  }

  void navigateToColorPicker(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return ColorPicker();
    }));
  }

  // void navigateToShades(BuildContext context, MaterialAccentColor color) {
  //   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
  //     return Shades(
  //       color: color,
  //     );
  //   }));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Colors')),
      body: ListView.builder(
        itemCount: Colors.accents.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              navigateToShadesStatic(context, Colors.accents.elementAt(index));
            },
            child: ListItem(
              color: Colors.accents.elementAt(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToColorPicker(context);
        },
        tooltip: 'navigate_to_color_picker',
        child: Icon(Icons.add),
      ),
    );
  }
}
