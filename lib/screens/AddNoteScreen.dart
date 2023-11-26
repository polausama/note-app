import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_noe_app/controllers/AddNote/AddNoteCubit.dart';
import 'package:flutter_noe_app/controllers/AddNote/AddNoteState.dart';
import 'package:flutter_noe_app/controllers/datetime/dateTimeCubit.dart';
import 'package:flutter_noe_app/controllers/datetime/dateTimeState.dart';
import 'package:flutter_noe_app/controllers/lang/langCubit.dart';
import 'package:flutter_noe_app/widgets/CustomTfUserName.dart';
import 'package:flutter_noe_app/widgets/MyBotton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:intl/intl.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  Future<void> _showMyDialog(int index) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Note access'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Tell me password of this note'),
                Text('To Delete it'),
                TextField(
                  controller: AddNoteCubit.get(context).passwordController,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                AddNoteCubit.get(context).DeleteNoteWithPassword(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AddNoteCubit.get(context).getDataFromDB();
    AddNoteCubit.get(context).getRandomColor();
    DateTimeCubit.get(context).changeDateTome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.noteapp,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[500],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [TextButton(
            onPressed: (){
              LangCubit.get(context).changelang('ar');
            }, 
            child: Text(AppLocalizations.of(context)!.arabic)),
            TextButton(
            onPressed: (){
              LangCubit.get(context).changelang('en');
            }, 
            child: Text(AppLocalizations.of(context)!.english))],
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: BlocBuilder<AddNoteCubit, AddNoteState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 20),
                    color: AddNoteCubit.get(context).getRandomColor(),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                    maxLines: 3,
                                    text: TextSpan(
                                      text: AddNoteCubit.get(context)
                                          .notes[index]
                                          .title
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          height: 1.5),
                                    )),
                                Text(
                                    AddNoteCubit.get(context)
                                        .notes[index]
                                        .content
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic,
                                    ))
                              ],
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: 
                             BlocBuilder<DateTimeCubit,DateTimeState>(
                              builder: (context, state) {
                                return  Text(
                                AddNoteCubit.get(context).notes[index].datetime.toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey[800]),
                              );
                              },)
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  if (AddNoteCubit.get(context)
                                      .notes[index]
                                      .password!
                                      .isNotEmpty) {
                                    _showMyDialog(index);
                                  } else {
                                    AddNoteCubit.get(context).deleteNote(index);
                                  }
                                },
                                icon: Icon(Icons.delete)),
                            leading: Visibility(
                              visible: !AddNoteCubit.get(context)
                                  .notes[index]
                                  .password!
                                  .isEmpty,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.lock_outline)),
                            ))),
                  ),
                );
              },
              itemCount: AddNoteCubit.get(context).notes.length,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showModalBottomSheet(
            backgroundColor: Colors.grey[800],
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  top: 15,
                  right: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Form(
                  key: AddNoteCubit.get(context).formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Custom_Text_Field(
                        hintName: AppLocalizations.of(context)!.title,
                        saved: (value) {
                          AddNoteCubit.get(context).note.title = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppLocalizations.of(context)!.entertitle;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Custom_Text_Field(
                        hintName: AppLocalizations.of(context)!.yournote,
                        saved: (value) {
                          AddNoteCubit.get(context).note.content = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppLocalizations.of(context)!.enteryournote;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Custom_Text_Field(
                        hintName: AppLocalizations.of(context)!.password,
                        saved: (value) {
                          AddNoteCubit.get(context).note.password = value;
                        },
                        validator: (value) {
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MyButton(
                        text: AppLocalizations.of(context)!.addyournote,
                        onTap: () {
                          AddNoteCubit.get(context).addNote();
                          DateTimeCubit.get(context).changeDateTome();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        elevation: 10,
        child: const Icon(
          Icons.add,
          size: 38,
        ),
      ),
    );
  }
}
