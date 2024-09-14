import 'dart:developer';

import 'package:calendar/src/presentation/shared/list_component.dart';
import 'package:flutter/material.dart';

class IList extends StatefulWidget {
  final List<String> items;
  const IList({super.key, required this.items});

  @override
  State<IList> createState() => _IListState();
}

class _IListState extends State<IList> {
  Set<int> selectedIndices = {};

  void toggleSelection(int index) {
    setState(() {
      if (selectedIndices.contains(index)) {
        selectedIndices.remove(index);
      } else {
        selectedIndices.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: widget.items.asMap().entries.map((entry) {
        int index = entry.key;
        String item = entry.value;
        bool isSelected = selectedIndices.contains(index);
        log(selectedIndices.toString());
        return ListComponent(
          text: item,
          isSelected: isSelected,
          onTap: () => toggleSelection(index),
        );
      }).toList(),
    );
  }
}
