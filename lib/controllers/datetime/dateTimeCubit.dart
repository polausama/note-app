import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_noe_app/controllers/datetime/dateTimeState.dart';
import 'package:flutter_noe_app/controllers/lang/langState.dart';
import 'package:intl/intl.dart';

class DateTimeCubit extends Cubit <DateTimeState> {
  String time = "";

  DateTimeCubit():super(InitDatetime());
  
    static DateTimeCubit get(context) => BlocProvider.of(context);

  void changeDateTome(){
    final now =DateTime.now();
     time = DateFormat("dd-MM-yyyy").format(now);
    emit(changeDateTimeState());
    
  }

  
}