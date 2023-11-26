import 'package:flutter/material.dart';
import 'package:flutter_noe_app/constrains.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  "assets/images/cover.png",
                  width: 700,
                  height: 700,
                ),
              ),
              Text(
                "Create and Manage your Notes",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              //
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, loginScreenPath);
                },
                child: Text(
                  "Continue login page",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }
}
