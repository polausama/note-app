import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_noe_app/constrains.dart';
import 'package:flutter_noe_app/controllers/login/LoginController.dart';
import 'package:flutter_noe_app/controllers/login/LoginState.dart';
import 'package:flutter_noe_app/widgets/CustomTfPassword.dart';
import 'package:flutter_noe_app/widgets/CustomTfUserName.dart';
import 'package:flutter_noe_app/widgets/MyBotton.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var snackBar = SnackBar(
    backgroundColor: Colors.green,
    content: Text('Login Sucssfuel'),
  );
   var snackBar1 = SnackBar(
    backgroundColor: Colors.red,
    content: Text('invalid password or email'),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Center(
          child: Form(
            key: LoginContorllerCubit.get(context).formkey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 50),

              const Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(height: 50),

              Text(
                'Hello.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Lets get started.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 25),

              // username textfield
              Custom_Text_Field(
                hintName: 'Username',
                icon: Icons.person_2_outlined,
                labelName: 'Enter your name',
                saved: (value) {
                  LoginContorllerCubit.get(context).user.user = value;
                },
                validator: (value) {
                  if (value!.isEmpty || value == null) {
                    return "please enter your user name";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10),

              // password textfield
              Custom_TextField_password(
                hintName: 'Password',
                ispass: true,
                icon: Icons.lock,
                labelName: 'Enter your password',
                saved: (value) {
                  LoginContorllerCubit.get(context).user.password = value;
                },
                validator: (value) {
                  if (value!.isEmpty || value == null) {
                    return "please enter your password";
                  } else if (value.length < 6) {
                    return ' invalid password format';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10),
              BlocBuilder<LoginContorllerCubit, LoginState>(
                  builder: ((context, state) {
                return MyButton(
                  text: 'Login',
                  onTap: () async {
                    if (await LoginContorllerCubit.get(context).inlogin()==true) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pushNamed(context, addnoteScreenPath);
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(snackBar1);

                    }
                  },
                  isloading: state is LoadingLoginState ? true : false,
                );
              }))
            ]),
          ),
        ),
      ),
    );
  }
}
