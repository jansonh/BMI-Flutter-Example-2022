import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  State<MySlider> createState() => _SliderState();
}

class _SliderState extends State<MySlider> {
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Height',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF8D8E98),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              height.toString(),
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Text(
              'cm',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF8D8E98),
              ),
            ),
          ],
        ),
        Slider(
            value: height.toDouble(),
            min: 120,
            max: 220,
            onChanged: (double newValue) {
              setState(() {
                height = newValue.round();
              });
            }),
      ],
    );
  }
}
