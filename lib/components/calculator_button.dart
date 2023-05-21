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
    final theme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height / 7.2,
      width: size.width / 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: ElevatedButton(
          child: Text(
            title,
            style: TextStyle(
              color: title == "=" ? theme.secondary : theme.tertiary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            elevation: 4,
            backgroundColor: color ?? theme.secondary,
            shape: const RoundedRectangleBorder(),
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
