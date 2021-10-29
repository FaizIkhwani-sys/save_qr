import 'package:flutter/material.dart';

class AppRadioListTile extends StatelessWidget {
  final String title, subtitle;
  final dynamic groupValue;
  final Function onChange;
  final List<RadioListItem> radioList;
  final bool enable;

  const AppRadioListTile(
      {Key key,
      @required this.title,
      @required this.subtitle,
      @required this.onChange,
      @required this.radioList,
      @required this.groupValue,
      this.enable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(subtitle),
          ),
          ...List.generate(radioList.length, (index) {
            return RadioListTile<dynamic>(
              title: Text(radioList[index].title),
              value: radioList[index].value,
              groupValue: groupValue,
              onChanged: enable ? onChange : null,
            );
          }),
        ],
      ),
    );
  }
}

class RadioListItem {
  dynamic value;
  String title;

  RadioListItem(this.value, this.title);
}
