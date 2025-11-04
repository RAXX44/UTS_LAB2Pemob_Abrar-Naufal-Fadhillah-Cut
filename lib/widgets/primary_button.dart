import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const PrimaryButton({required this.text, required this.onPressed, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return SizedBox(
      width: mq.size.width * 0.8,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text, style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
