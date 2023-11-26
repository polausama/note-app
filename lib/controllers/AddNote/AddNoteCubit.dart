import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_noe_app/constants/constants.dart';
import 'package:flutter_noe_app/controllers/AddNote/AddNoteState.dart';
import 'package:flutter_noe_app/local/OfflineDatabase.dart';
import 'package:flutter_noe_app/models/Note.dart';
import 'package:path/path.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(InitAddNote());
  TextEditingController passwordController = TextEditingController();

  static AddNoteCubit get(context) => BlocProvider.of(context);

  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Note note = Note();
  List<Note> notes = [];
  Future<void> addNote() async {
    bool valid = formkey.currentState!.validate();
    if (valid) {
      formkey.currentState!.save();
      MyDataBase mydatabase = MyDataBase();
      Note mewnote = Note(
        title: note.title,
        content: note.content,
        password: note.password,
        id: notes.length + 1,
      );
      await mydatabase.insertNoteInDb(note);
      notes.add(note);
      formkey.currentState!.reset();
      emit(AddNotesState());
    }
  }

  void getDataFromDB() async {
    emit(LoadingAddNoteState());
    MyDataBase myDB = MyDataBase();
    notes = await myDB.getNotesFromDb();
    emit(SucssfuelAddNoteState());
  }

  void deleteNote(int index) async {
    MyDataBase myDB = MyDataBase();
    await myDB.deleteNote(notes[index]);
    notes.removeAt(index);
    emit(DeleteNoteState());
  }

  void DeleteNoteWithPassword(int index) async {
    MyDataBase myDB = MyDataBase();
    if (notes[index].password == passwordController.text) {
      await myDB.deleteNote(notes[index]);
      notes.removeAt(index);
      emit(DeleteNoteState());
    }
  }
}
