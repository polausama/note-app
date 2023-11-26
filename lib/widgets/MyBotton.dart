import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyButton extends StatefulWidget {
  final Function()? onTap;
  String text;
  final bool isloading;

  MyButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.isloading = false});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool color = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: color ? Colors.red : Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Visibility(
                visible: !widget.isloading,
                replacement: CircularProgressIndicator(
                  color: Colors.white,
                ),
                child: Text(
                  widget.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ))),
      ),
    );
  }
}
