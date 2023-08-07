import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/customVibration.dart';
import 'package:flutter_application_1/widgets/customButtons.dart';
import 'package:flutter_application_1/widgets/customSlider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _amplitude = 0;
  CustomVibrationPattern _pattern = CustomVibrationPattern.normal;
  bool _isVibrate = false;

  void updateAmplitude(double value) {
    setState(() {
      _amplitude = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            const Text('진동 세기',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            CustomSlider(_amplitude, updateAmplitude),
          ],
        ),
        TextButton(
          onPressed: () async {
            // Respond to button press
            bool hasVibrator = await CustomVibration.hasVibrator();
            setState(() {
              if (hasVibrator) {
                CustomVibration.cancel();
                _isVibrate = false;
                return;
              }

              CustomVibration.vibrate(_amplitude.round());
              _isVibrate = true;
            });
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            minimumSize: const Size(180, 50),
          ),
          child: Text(
            _isVibrate ? '멈추기' : '울리기',
            style: const TextStyle(
              color: Colors.pinkAccent,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CustomButtons<CustomVibrationPattern>(
          _pattern,
          CustomVibrationPattern.values.map((item) {
            ButtonItem<CustomVibrationPattern> buttonItem =
                ButtonItem<CustomVibrationPattern>(item.patternName, item);
            return buttonItem;
          }).toList(),
          (value) {
            CustomVibration.pattern(value);
            setState(() {
              _pattern = value;
            });
          },
        )
      ],
    );
  }
}
