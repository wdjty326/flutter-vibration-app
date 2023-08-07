import 'package:flutter/material.dart';

class ButtonItem<T> {
  ButtonItem(this._name, this._value);

  String _name;
  T _value;

  String get name => _name;
  T get value => _value;

  set name(String name) => _name = name;
  set id(T value) => _value = value;
}

class CustomButtons<T> extends StatelessWidget {
  const CustomButtons(this._value, this._list, this.onChanged, {super.key});

  final T _value;
  final List<ButtonItem<T>> _list;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _list
            .map((item) => (TextButton(
                  onPressed: () {
                    onChanged(item.value);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: item.value == _value
                          ? Colors.pinkAccent
                          : Colors.white),
                  child: Text(item.name,
                      style: TextStyle(
                        color: item.value == _value
                            ? Colors.white
                            : Colors.pinkAccent,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )),
                )))
            .toList());
  }
}
