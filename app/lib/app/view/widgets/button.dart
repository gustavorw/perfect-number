import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  const Button({required this.label, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(label, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
