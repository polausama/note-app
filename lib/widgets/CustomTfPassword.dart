import 'package:flutter/material.dart';

class Custom_TextField_password extends StatelessWidget {
  String? hintName;
  String? labelName;
  IconData? icon;
  final bool ispass;
  final void Function(String? value)? saved;
  final String? Function(String?) validator;

  Custom_TextField_password(
      {this.hintName,
      this.icon,
      this.labelName,
      this.saved,
      required this.validator,
      required this.ispass});
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
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
          prefixIcon: Icon(icon),
          hintText: hintName,
          labelText: labelName,
          labelStyle: TextStyle(color: Colors.black, fontSize: 20),
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    );
  }
}
