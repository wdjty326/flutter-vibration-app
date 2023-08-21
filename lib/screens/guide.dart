import 'package:flutter/material.dart';

const _headingStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);

const _subHeadingStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);

const _descriptionStyle =
    TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: Colors.white);

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            '자주묻는질문',
            style: _headingStyle,
            textAlign: TextAlign.left,
          ),
          const Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Divider(
                thickness: 2,
                color: Colors.white,
              )),
          const Padding(
              // 진동이 안울려요 가이드
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. 진동이 안울려요',
                    style: _subHeadingStyle,
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '\'설정\' > \'소리 및 진동\' 에서 무음모드인지 확인하세요.',
                    style: _descriptionStyle,
                    textAlign: TextAlign.left,
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '2. 진동이 약해요',
                  style: _subHeadingStyle,
                  textAlign: TextAlign.left,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Image.asset('assets/images/Android_Robot.png',
                          width: 30, height: 30),
                    ),
                    const Text(
                      '안드로이드',
                      style: _descriptionStyle,
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
                const Text(
                  '\'설정\' > \'소리 및 진동\' > \'진동 세기\' 에서 진동을 최대치로 올려주세요.',
                  style: _descriptionStyle,
                  textAlign: TextAlign.left,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Image.asset('assets/images/apple-logo.png',
                          width: 30, height: 30),
                    ),
                    const Text(
                      'IOS',
                      style: _descriptionStyle,
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
                const Text(
                  '진동 세기를 지원하지 않습니다.',
                  style: _descriptionStyle,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
