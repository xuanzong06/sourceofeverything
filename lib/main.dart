import 'dart:math';

import 'package:flutter/material.dart';

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

// 共通
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

Color getRandomColor() {
  // 生成隨機的 RGB 顏色
  Random random = Random();
  int red = random.nextInt(256);
  int green = random.nextInt(256);
  int blue = random.nextInt(256);

  return Color.fromRGBO(red, green, blue, 1.0);
}

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

class InputSalary extends StatefulWidget {
  const InputSalary({super.key, required this.title});

  final String title;

  @override
  State<InputSalary> createState() => _InputSalaryState();
}

class _InputSalaryState extends State<InputSalary> {
  late TextEditingController _basicSalaryController; //基本薪資
  late TextEditingController _lunchController; //午餐費
  late TextEditingController _overtimeController; //加班費
  late TextEditingController _trustBonusController; //信託
  late TextEditingController _dateController; //日期
  late TextEditingController _newEmployerController; //新制
  late TextEditingController _healthInsuranceController;
  late TextEditingController _laborInsuranceController;
  late TextEditingController _employeeBenefitsController;
  late TextEditingController _industryUnionFeeController;
  late TextEditingController _supplementaryInsuranceController;
  late TextEditingController _employeeStockSelfController;

  @override
  void initState() {
    super.initState();

    _dateController = TextEditingController();
    _basicSalaryController = TextEditingController();
    _lunchController = TextEditingController();
    _overtimeController = TextEditingController();
    _trustBonusController = TextEditingController();
    _newEmployerController = TextEditingController();
    _healthInsuranceController = TextEditingController();
    _laborInsuranceController = TextEditingController();
    _employeeBenefitsController = TextEditingController();
    _industryUnionFeeController = TextEditingController();
    _supplementaryInsuranceController = TextEditingController();
    _employeeStockSelfController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _selectDate() async {
      DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );

      if (_picked != null) {
        setState(() {
          _dateController.text = _picked.toString().split(" ")[0];
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Date',
                  filled: true,
                  prefixIcon: Icon(Icons.calendar_today),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                readOnly: true,
                onTap: () {
                  _selectDate();
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('應發金額'),
                      CustomInputField(
                          labelText: '本薪',
                          controller: _basicSalaryController,
                          keyboardType: TextInputType.number),
                      CustomInputFieldHint(
                          labelText: '午餐費',
                          controller: _lunchController,
                          keyboardType: TextInputType.number),
                      CustomInputField(
                          labelText: '加班費',
                          controller: _overtimeController,
                          keyboardType: TextInputType.number),
                      CustomInputFieldHint(
                          labelText: '持股信託',
                          controller: _trustBonusController,
                          keyboardType: TextInputType.number),
                      CustomInputFieldHint(
                          labelText: '新制雇主提繳',
                          controller: _newEmployerController,
                          keyboardType: TextInputType.number),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('應扣金額'),
                      CustomInputField(
                          labelText: '健保費本人自付',
                          controller: _healthInsuranceController,
                          keyboardType: TextInputType.number),
                      CustomInputFieldHint(
                          labelText: '勞保費自付',
                          controller: _laborInsuranceController,
                          keyboardType: TextInputType.number),
                      CustomInputFieldHint(
                          labelText: '職工福利費',
                          controller: _employeeBenefitsController,
                          keyboardType: TextInputType.number),
                      CustomInputFieldHint(
                          labelText: '產業工會會費',
                          controller: _industryUnionFeeController,
                          keyboardType: TextInputType.number),
                      CustomInputFieldHint(
                          labelText: '補充健保費',
                          controller: _supplementaryInsuranceController,
                          keyboardType: TextInputType.number),
                      CustomInputFieldHint(
                          labelText: '員工持股信託自提金',
                          controller: _employeeStockSelfController,
                          keyboardType: TextInputType.number),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '新增',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const CustomInputField({
    required this.labelText,
    required this.controller,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(labelText),
        Container(
          width: 85,
          height: 50,
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              // labelText: labelText,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomInputFieldHint extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const CustomInputFieldHint({
    required this.labelText,
    required this.controller,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    String fixText = "";
    if (labelText == "持股信託") {
      fixText = "1500";
    }
    if (labelText == "午餐費") {
      fixText = "2400";
    }
    if (labelText == "員工持股信託自提金") {
      fixText = "2000";
    }
    if (labelText == "職工福利費") {
      fixText = "235";
    }
    if (labelText == "產業工會會費") {
      fixText = "250";
    }
    if (labelText == "補充健保費") {
      fixText = "32";
    }
    if (labelText == "勞保費自付") {
      fixText = "1100";
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(labelText),
        Container(
          width: 85,
          height: 50,
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: fixText,
              // labelText: labelText,
            ),
          ),
        ),
      ],
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
