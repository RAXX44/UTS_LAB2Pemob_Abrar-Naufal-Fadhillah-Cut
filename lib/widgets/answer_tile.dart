import 'package:flutter/material.dart';

class AnswerTile extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const AnswerTile({required this.text, required this.selected, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        margin: EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: selected ? Theme.of(context).colorScheme.primary : Colors.grey.shade300, width: selected ? 2 : 1),
          color: selected ? Theme.of(context).colorScheme.primary.withOpacity(0.08) : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(selected ? Icons.check_circle : Icons.circle_outlined),
            SizedBox(width: 10),
            Expanded(child: Text(text, style: TextStyle(fontFamily: 'Poppins'))),
          ],
        ),
      ),
    );
  }
}
