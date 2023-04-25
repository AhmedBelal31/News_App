import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/const/constant.dart';

class Setting extends StatefulWidget {

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: () {
            setState(() {

            });
          }
          ,
          child: Text("Switch Theme"),
        )
      ],
    );
  }
}
