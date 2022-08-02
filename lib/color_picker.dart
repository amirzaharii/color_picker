import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({Key? key}) : super(key: key);

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int currentValueR = 1;
  int currentValueG = 1;
  int currentValueB = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick your color'),
      ),
      body: Column(
        children: [
          Slider(
            value: currentValueR.toDouble(),
            max: 255,
            activeColor: Colors.red,
            inactiveColor: Colors.red[100],
            onChanged: (double value) {
              setState(() {
                currentValueR = value.toInt();
              });
            },
          ),
          Slider(
            value: currentValueG.toDouble(),
            max: 255,
            activeColor: Colors.green,
            inactiveColor: Colors.green[100],
            onChanged: (double value) {
              setState(() {
                currentValueG = value.toInt();
              });
            },
          ),
          Slider(
            value: currentValueB.toDouble(),
            max: 255,
            activeColor: Colors.blue,
            inactiveColor: Colors.blue[100],
            onChanged: (double value) {
              setState(() {
                currentValueB = value.toInt();
              });
            },
          ),
          Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(
                    currentValueR, currentValueG, currentValueB, 1.0)),
          ),
          TextButton(
            child: Text(
              'Pick this color',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        title: const Text('You have picked this color :'),
                        content: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(currentValueR,
                                  currentValueG, currentValueB, 1.0)),
                          child: Text(
                            'RGB(${currentValueR}, ${currentValueG}, ${currentValueB})',
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: Text('OK')),
                        ],
                      ));
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(10),
              backgroundColor: Colors.lightBlue,
            ),
          ),
        ],
      ),
    );
  }
}
