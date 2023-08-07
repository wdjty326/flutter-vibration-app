import 'package:flutter/material.dart';

/// Flutter code sample for [Slider].

class CustomSlider extends StatelessWidget {
  const CustomSlider(this._currentSliderValue, this.onChanged, {super.key});

  final double _currentSliderValue;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 255,
      divisions: 10,
      min: 0,
      label: _currentSliderValue.round().toString(),
      onChanged: onChanged,
    );
  }
}
