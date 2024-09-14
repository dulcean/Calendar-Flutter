import 'dart:developer';

import 'package:calendar/src/presentation/constants/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class ButtonList extends StatefulWidget {
  final void Function(int index)? onButtonPressed;
  const ButtonList({super.key, this.onButtonPressed});

  @override
  State<ButtonList> createState() => _ButtonListState();
}

class _ButtonListState extends State<ButtonList> {
  int? selectedIndex;
  final List<String> images = <String>[
    Assets.png.b1.path,
    Assets.png.b2.path,
    Assets.png.b3.path,
    Assets.png.b4.path,
    Assets.png.b5.path,
    Assets.png.b6.path,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 118,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              log('Button $index pressed');
              setState(() {
                selectedIndex = index;
              });
              if (widget.onButtonPressed != null) {
                widget.onButtonPressed!(index);
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 83,
                height: 118,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(76),
                  border: isSelected
                      ? Border.all(
                          color: Theme.of(context).primaryColor, width: 3.0)
                      : null,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(1, 0),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(76),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                    height: 118,
                    width: 83,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
