import 'package:flutter/material.dart';
import 'LinkContainer.dart';

class PagesButton extends StatelessWidget {
  const PagesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('第一個畫面'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LinkContainer(context, 'KnowDeviceInfo', '裝置的邊界資訊'),
            LinkContainer(context, 'InputSalary', '計算薪資'),
          ],
        ),
      ),
    );
  }
}