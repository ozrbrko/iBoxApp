import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButtons {


  Widget elevatedButton({Function()? onPressed, var color, bool enable = true, Widget? child}) {
    return Platform.isAndroid
        ? ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0), side: BorderSide(color: color)))),
      // style: ElevatedButton.styleFrom(primary: color // background
      //     // onPrimary: Colors.white, // foreground
      //     ),
    )
        : CupertinoButton(
      color: color,
      onPressed: onPressed,
      child: child!,
    );
  }


}
