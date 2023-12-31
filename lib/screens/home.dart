import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/patterns.dart';
import 'package:flutter_application_1/utilities/customVibration.dart';
import 'package:flutter_application_1/widgets/baseLayout.dart';
import 'package:flutter_application_1/widgets/customButtons.dart';
import 'package:flutter_application_1/widgets/customSlider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  double _amplitude = 0;
  CustomVibrationPattern _pattern = CustomVibrationPattern.normal;
  bool _isVibrate = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    debugPrint('life state:${state.toString()}');
    bool isVibrate = await CustomVibration.hasVibrator();

    switch (state) {
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
        if (isVibrate) CustomVibration.cancel();
        _isVibrate = false;
        break;
      default:
    }
  }

  void updateAmplitude(double value) async {
    //var obj = await getVibrationPatterns();
    bool hasVibrator = await CustomVibration.hasVibrator();

    setState(() {
      _amplitude = value;
      if (hasVibrator) {
        CustomVibration.cancel();
        CustomVibration.vibrate(value.round());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        child: Column(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              width: 72,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white),
              //color: Colors.white,
              child: Text((_amplitude ~/ 51).toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
            ),
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

              if (CustomVibration.vibrate(_amplitude.round())) {
                _isVibrate = true;
              }
            });
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            minimumSize: const Size(180, 50),
          ),
          child: Text(
            _isVibrate ? '정지' : '시작',
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
    ));
  }
}
