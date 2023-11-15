import 'package:flutter/material.dart';
import 'BaseUI/KnowDeviceInfo.dart';
import 'Account/InputSalary.dart';
import 'BaseUI/PagesButton.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => PagesButton(),
        '/KnowDeviceInfo': (context) => KnowDeviceInfo(),
        '/InputSalary': (context) =>
            InputSalary(title: 'SourceOfEverything :P'),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // 由於建立了 initalRoute 就不用設定 home 屬性
      // home: const InputSalary(title: 'SourceOfEverything :P'),
      // home: const PagesButton(),
    );
  }
}

class BasicInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

void SomeUseful() {
  var map = Map<String, dynamic>();
  String paramStr = 'hello world';
  map['param_name'] = 'source';
  map['param1'] = paramStr;
}

//呼叫後台PHP
void BackToChaos() async {
  try {
    // final respones =  await http.post(Uri.parse(_globalvar.Global_URL), body: map);
    // if (200 == respones.statusCode) {
    //   print('success');
    // } else {
    //   print("error");
    // }
  } catch (e) {}
}
