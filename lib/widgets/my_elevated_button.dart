import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    Key? key,
    required this.buttonName,
    required this.buttonColor,
    required this.onPressed,
  }) : super(key: key);

  final String buttonName;
  final Color buttonColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Text(buttonName),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(40.0),
        primary: buttonColor,
        onPrimary: Colors.white,
        shape: const StadiumBorder(),
        elevation: 5.0,
      ),
    );
  }
}
