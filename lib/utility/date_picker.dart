import 'package:flutter/material.dart';

class DOBTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final VoidCallback? onTap;

  const DOBTextField({
    Key? key,
    required this.controller,
    required this.hint,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      readOnly: true,
      decoration: InputDecoration(
        hintText: hint,
        labelText: 'Date of Birth',
        suffixIcon: Icon(Icons.calendar_today),
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      ),
    );
  }
}
