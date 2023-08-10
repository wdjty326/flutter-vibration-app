import 'package:flutter/material.dart';

/// Flutter code sample for [Slider].

class CustomSlider extends StatelessWidget {
  const CustomSlider(this._currentSliderValue, this.onChanged, {super.key});

  final double _currentSliderValue;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: RotatedBox(
        quarterTurns: 3,
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            //activeTrackColor: Colors.blue,
            //inactiveTrackColor: Colors.blue,
            trackHeight: 72,
            overlayColor: Colors.red.withAlpha(32),
            trackShape: RoundedRectSliderTrackShape(),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
            //valueIndicatorShape: RoundSliderOverlayShape()
          ),
          child: Slider(
            min: 0.0,
            max: 255.0,
            value: _currentSliderValue,
            divisions: 5,
            //label: (_currentSliderValue ~/ 51.0).toInt().toString(),
            onChanged: onChanged,
            //activeColor: Colors.pink,
          ),
        ),
      ),
    );
  }
}
