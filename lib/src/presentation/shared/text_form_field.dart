import 'package:calendar/src/presentation/constants/fonts/fonts.gen.dart';
import 'package:flutter/material.dart';

class MultiLineTextFormField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  MultiLineTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextFormField(
        controller: _controller,
        maxLines: null,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Введите заметку',
          hintStyle: TextStyle(
              fontFamily: FontFamily.nunito,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFFBCBCBF)),
          contentPadding: EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}
