import 'package:flutter/material.dart';

class TransactionsTextField extends StatelessWidget {
  const TransactionsTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.left = 24,
    this.right = 24,
    this.bottom = 0,
  });

  final TextEditingController controller;
  final String hintText;
  final double left;
  final double right;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        right: right,
        bottom: bottom,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: hintText,
          fillColor: Colors.white70,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.green,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
