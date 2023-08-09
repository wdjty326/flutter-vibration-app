import 'package:flutter/material.dart';

/// Flutter code sample for [Slider].

class CustomSlider extends StatelessWidget {
  const CustomSlider(this._currentSliderValue, this.onChanged, {super.key});

  final double _currentSliderValue;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        //activeTrackColor: Colors.blue,
        //inactiveTrackColor: Colors.blue,
        trackShape: RectangularSliderTrackShape(),
        trackHeight: 4.0,
        //thumbColor: Colors.blueAccent,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
        overlayColor: Colors.red.withAlpha(32),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
      ),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            // 레이아웃확인용 코드
            border: Border(
                bottom: BorderSide(width: 2),
                top: BorderSide(width: 2),
                right: BorderSide(width: 2),
                left: BorderSide(width: 2))),
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()..rotateZ(90 * 3.1415927 / 180),
          child: Slider(
            min: 1.0,
            max: 255.0,
            value: _currentSliderValue,
            divisions: 51,
            label: _currentSliderValue.round().toString(),
            onChanged: onChanged,
            activeColor: Colors.pink,
          ),
        ),
      ),
    );
  }
}
