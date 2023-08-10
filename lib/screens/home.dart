import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/customVibration.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomSlider(_amplitude, updateAmplitude),
            Container(
              //padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 20.0),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xFFFFFF)),
              //color: Colors.white,
              child: Text((_amplitude ~/ 51).toInt().toString()),
            )
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
