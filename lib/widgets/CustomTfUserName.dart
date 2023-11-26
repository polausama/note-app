import 'package:flutter/material.dart';

class Custom_Text_Field extends StatelessWidget {
  String? hintName;
  String? labelName;
  String? username;
  IconData? icon;
  final bool ispass;
  final void Function(String? value)? saved;
  final String? Function(String?) validator;

  Custom_Text_Field(
      {this.hintName,
      this.icon,
      this.labelName,
      this.saved,
      required this.validator,
      this.ispass = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        obscureText: ispass,
        onSaved: saved,
        validator: validator,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
          prefixIcon: Icon(icon),
          hintText: hintName,
          labelText: labelName,
          labelStyle: TextStyle(fontSize: 20, color: Colors.black),
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    );
  }
}
