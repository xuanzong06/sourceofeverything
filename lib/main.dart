import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'SourceOfEverything :P'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _basicSalaryController;
  late TextEditingController _lunchController;
  late TextEditingController _overtimeController;
  late TextEditingController _trustBonusController;

  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _basicSalaryController = TextEditingController();
    _lunchController = TextEditingController();
    _overtimeController = TextEditingController();
    _trustBonusController = TextEditingController();
    _dateController = TextEditingController();
    // _newEmployerController = TextEditingController();
    // _healthInsuranceController = TextEditingController();
    // _laborInsuranceController = TextEditingController();
    // _employeeBenefitsController = TextEditingController();
    // _industryUnionFeeController = TextEditingController();
    // _supplementaryInsuranceController = TextEditingController();
    // _employeeStockSelfController = TextEditingController();
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
      body: Column(
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
                        controller: _trustBonusController,
                        keyboardType: TextInputType.number),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                        controller: _trustBonusController,
                        keyboardType: TextInputType.number),
                  ],
                ),
              ),
            ],
          )
        ],
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
