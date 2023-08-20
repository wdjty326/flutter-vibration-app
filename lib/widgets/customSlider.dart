import 'package:flutter/material.dart';

//class CustomSliderThumbShape extends RoundSliderThumbShape {
//  const CustomSliderThumbShape(s)

//  @override
//  void paint(PaintingContext context, Offset center, {required Animation<double> activationAnimation, required Animation<double> enableAnimation, required bool isDiscrete, required TextPainter labelPainter, required RenderBox parentBox, required SliderThemeData sliderTheme, required TextDirection textDirection, required double value, required double textScaleFactor, required Size sizeWithOverflow}) {
//    // TODO: implement paint
//    super.paint(context, center, activationAnimation, enableAnimation, isDiscrete, labelPainter, parentBox, sliderTheme, textDirection, value, textScaleFactor, sizeWithOverflow);
//  }
//}

class CustomSlider extends StatelessWidget {
  const CustomSlider(this._currentSliderValue, this.onChanged, {super.key});

  final double _currentSliderValue;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: RotatedBox(
        quarterTurns: 3,
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
              trackHeight: 72,
              overlayColor: Colors.red.withAlpha(32),
              thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 0,
                  disabledThumbRadius: 36,
                  elevation: 0,
                  pressedElevation: 0),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0)),
          child: Slider(
            min: 0.0,
            max: 255.0,
            value: _currentSliderValue,
            divisions: 5,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
