import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/customVibration.dart';
import 'package:flutter_application_1/widgets/custemSlider.dart';

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
    var s = CustomVibrationPattern.values
        .map((e) => (TextButton(
              child: Text(e.patternType.toString()),
              onPressed: () {
                setState(() {
                  _pattern = e;
                });
              },
            )))
        .toList();
    return Column(
      children: <Widget>[
        Row(
          //mainAxisAlignment: MainAxisAlignment.start,
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
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: CustomVibrationPattern.values
                .map((e) => (TextButton(
                      child: Text(e.patternName,
                          style: TextStyle(
                            color: e == _pattern
                                ? Colors.white
                                : Colors.pinkAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: () {
                        CustomVibration.pattern(e);
                        setState(() {
                          _pattern = e;
                        });
                      },
                      style: TextButton.styleFrom(
                          backgroundColor:
                              e == _pattern ? Colors.pinkAccent : Colors.white),
                    )))
                .toList())
      ],
    );
  }
}
