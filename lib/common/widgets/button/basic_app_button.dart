import 'package:flutter/material.dart';
import 'package:tesis_v1/common/helpers/is_dark_mode.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double ? height;
  const BasicAppButton({
    required this.onPressed,
    required this.title,
    this.height,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
      ), 
      child: Text(
        title,
        style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: context.isDarkMode? Colors.white : Colors.black
                )
      )
    );
  }
}