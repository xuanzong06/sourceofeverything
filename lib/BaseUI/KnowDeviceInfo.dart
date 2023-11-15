import 'package:flutter/material.dart';

// KnowDeviceInfo
class KnowDeviceInfo extends StatefulWidget {
  const KnowDeviceInfo({super.key});

  @override
  State<KnowDeviceInfo> createState() => _KnowDeviceInfoState();
}

class _KnowDeviceInfoState extends State<KnowDeviceInfo> {
  @override
  Widget build(BuildContext context) {
    final double DeviceScreenWidth = MediaQuery.of(context).size.width;
    final double DeviceSrceenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        color: Colors.greenAccent,
        // height: 300,
        // width: 300,
        child: Column(
          children: [
            Text(
              '這個裝置的Width:$DeviceScreenWidth',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              '這個裝置的Width:$DeviceSrceenHeight',
              style: TextStyle(color: Colors.black),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: '回上頁',
              child: const Icon(Icons.arrow_back),
            ),
          ],
        ),
      ),
    );
  }
}