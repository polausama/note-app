import 'package:flutter/material.dart';

import 'package:flutter_noe_app/constrains.dart';
import 'package:flutter_noe_app/screens/AddNoteScreen.dart';
import 'package:flutter_noe_app/screens/HomeScreen.dart';
import 'package:flutter_noe_app/screens/LoginPage.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomePage());
      case loginScreenPath:
        return MaterialPageRoute(builder: (context) => LoginPage());
        case addnoteScreenPath:
        return MaterialPageRoute(builder: (context) => AddNote());
    }
  }
}
