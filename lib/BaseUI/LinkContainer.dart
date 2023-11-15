import 'package:flutter/material.dart';
import 'RandomFunction.dart';

Widget LinkContainer(BuildContext context, String pagename, String pageurl) {
  // Color randomColor = getRandomColor();
  return GestureDetector(
    child: Container(
      color: getRandomColor(),
      width: 200,
      height: 100,
      child: Center(
        child: Text(pageurl),
      ),
    ),
    onTap: () {
      //如果要使用我這種方式去建立Widget，會需要先建立Route
      // MaterialPageRoute(builder: (context) => const PageURL()),
      Navigator.pushNamed(context, '/' + pagename);
    },
  );
}