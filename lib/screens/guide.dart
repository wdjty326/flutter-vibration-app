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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      //mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
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
          '텍스트',
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
        const Text(
          '텍스트',
          style: _descriptionStyle,
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}
