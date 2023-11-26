import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_noe_app/controllers/login/LoginState.dart';
import 'package:flutter_noe_app/local/SharedPrefrence.dart';
import 'package:flutter_noe_app/models/user.dart';

class LoginContorllerCubit extends Cubit<LoginState> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  User user = User();

  static LoginContorllerCubit get(context) => BlocProvider.of(context);

  LoginContorllerCubit() : super(InitLogin());
  Future<bool> inlogin() async {
    var validate = formkey.currentState!.validate();
    if (validate) {
      formkey.currentState!.save();
      emit(LoadingLoginState());
      await Future.delayed(Duration(seconds: 3), () async {
        await SharePref.saveEmail(user.user!);
        await SharePref.savePassword(user.password!);
      });
      formkey.currentState!.reset();
      emit(SucssfuelLoadingState());
      return true;
    }else{
      return false;
    }
  }
}
