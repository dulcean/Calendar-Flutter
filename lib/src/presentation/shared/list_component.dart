import 'package:calendar/src/presentation/constants/fonts/fonts.gen.dart';
import 'package:flutter/material.dart';

class ListComponent extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const ListComponent({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final containerColor = isSelected ? theme.primaryColor : Colors.white;
    final currentTextColor = isSelected ? Colors.white : theme.canvasColor;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: currentTextColor,
            fontFamily: FontFamily.nunito,
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
