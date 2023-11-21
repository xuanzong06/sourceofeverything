import 'package:flutter/material.dart';
import 'CustomInputField.dart';

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
  late TextEditingController _trustBonusController; //員工持股信託獎勵金
  late TextEditingController _dateController; //日期
  late TextEditingController _newEmployerController; //新制雇主提繳
  late TextEditingController _healthInsuranceController; //健保費本人自付
  late TextEditingController _laborInsuranceController; //勞保費自付
  late TextEditingController _employeeBenefitsController; //職工福利費
  late TextEditingController _industryUnionFeeController; //產業工會會費
  late TextEditingController _supplementaryInsuranceController; //補充健保費
  late TextEditingController _employeeStockSelfController; //員工持股信託自提金

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
