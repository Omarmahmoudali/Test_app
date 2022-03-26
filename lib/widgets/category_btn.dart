import 'package:flutter/material.dart';

class CategoryBtn extends StatelessWidget {
  final String text;
  final bool isPressed;
  final Function() onPressed;

  const CategoryBtn(
      {Key? key,
      required this.text,
      required this.isPressed,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: isPressed ? Colors.white : Colors.black,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: isPressed?Colors.red:Colors.white,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(
          color:  isPressed?Colors.transparent:Colors.red,
          ),
        ),
      ),
    );
  }
}
