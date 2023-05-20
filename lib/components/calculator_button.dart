import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final Color? color;
  final String title;
  final VoidCallback onTap;

  const CalculatorButton({
    Key? key,
    this.color,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 7.32,
      width: MediaQuery.of(context).size.width / 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: ElevatedButton(
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xffFEFEFE),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.black,
            shape: const RoundedRectangleBorder(),
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
