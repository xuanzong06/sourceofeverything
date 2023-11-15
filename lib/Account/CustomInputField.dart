import 'package:flutter/material.dart';

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