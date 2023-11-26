import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_noe_app/controllers/lang/langState.dart';

class LangCubit extends Cubit <langState> {
  String lang = "en";
  LangCubit():super(Initlang());
    static LangCubit get(context) => BlocProvider.of(context);

  void changelang(String langcode){
    lang = langcode;
    emit(changelangState());
  }

  
}