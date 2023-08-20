import 'package:flutter/material.dart';

const _headingStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);

const _subHeadingStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);

const _descriptionStyle =
    TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white);

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              constraints: const BoxConstraints(minWidth: double.infinity),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 2, color: Colors.white30))),
              child: const Text(
                '자주묻는질문',
                style: _headingStyle,
                textAlign: TextAlign.left,
              )),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: const Text(
              '1. 진동이 안울려요',
              style: _subHeadingStyle,
              textAlign: TextAlign.left,
            ),
          ),
          const Text(
            '\'설정\' > \'소리 및 진동\' 에서 무음모드인지 확인하세요.',
            style: _descriptionStyle,
            textAlign: TextAlign.left,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: const Text(
              '2. 진동이 약해요',
              style: _subHeadingStyle,
              textAlign: TextAlign.left,
            ),
          ),
          Row(
            children: [
              Image.asset('assets/images/Android_Robot.png',
                  width: 30, height: 30),
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
            children: [
              Image.asset('assets/images/Android_Robot.png',
                  width: 30, height: 30),
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
    );
  }
}
