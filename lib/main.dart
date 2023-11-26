import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_noe_app/approuter.dart';
import 'package:flutter_noe_app/controllers/AddNote/AddNoteCubit.dart';
import 'package:flutter_noe_app/controllers/datetime/dateTimeCubit.dart';
import 'package:flutter_noe_app/controllers/lang/langCubit.dart';
import 'package:flutter_noe_app/controllers/lang/langState.dart';
import 'package:flutter_noe_app/controllers/login/LoginController.dart';
import 'package:flutter_noe_app/local/SharedPrefrence.dart';
import 'package:flutter_noe_app/screens/AddNoteScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharePref.init();
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginContorllerCubit(),
          ),
          BlocProvider(
            create: (context) => AddNoteCubit(),
          ),
           BlocProvider(
            create: (context) => LangCubit(),
          ),
          BlocProvider(
            create: (context) => DateTimeCubit(),
          ),
        ],
        child: 
        BlocBuilder<LangCubit,langState>(builder: (context, state) {
          return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates:AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(LangCubit.get(context).lang),
          //home: AddNote(),
          onGenerateRoute: AppRouter.generateRoute,
        );
        },)
        );
  }
}
