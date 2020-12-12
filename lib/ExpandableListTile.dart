import 'package:flutter/material.dart';

class ExpandableListTile extends StatelessWidget {
  ExpandableListTile({this.title, this.subtitle});

  final String title;
  final String subtitle;


  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text(
          this.title,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          ListTile(
            title: Text(
              this.subtitle,
            )
          )]);
  }
}
