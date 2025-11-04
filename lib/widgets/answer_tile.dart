import 'package:flutter/material.dart';

class AnswerTile extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;
  const AnswerTile({required this.text, required this.selected, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderColor = selected ? Theme.of(context).colorScheme.primary : Colors.grey.shade300;
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor, width: selected ? 2 : 1),
          color: selected ? Theme.of(context).colorScheme.primary.withOpacity(0.08) : null,
        ),
        child: Row(
          children: [
            Icon(selected ? Icons.check_circle : Icons.circle_outlined),
            const SizedBox(width: 10),
            Expanded(child: Text(text, style: const TextStyle(fontFamily: 'Poppins'))),
          ],
        ),
      ),
    );
  }
}
