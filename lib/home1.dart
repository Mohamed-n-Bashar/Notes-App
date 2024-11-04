// ignore_for_file: prefer_final_fields
import 'package:flutter/material.dart';
import 'package:local_database/db/crud.dart';
import 'package:local_database/modal/note.dart';
import 'package:local_database/utils/context_extention.dart';
import 'package:local_database/utils/date_manager.dart';

class home1 extends StatefulWidget {
  const home1({super.key});

  @override
  State<home1> createState() => _home1State();
}

class _home1State extends State<home1> {
  final TextEditingController _controller = TextEditingController();
  late TextEditingController _Updatecontroller;
  final GlobalKey<FormState> _key = GlobalKey();
  final GlobalKey<FormState> _Updatekey = GlobalKey();
  List<Note> notes = [];

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getNote();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _controller,
                        decoration: const InputDecoration(
                            labelText: 'Note',
                            prefixIcon: Icon(Icons.note_alt),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)))),
                        validator: (value) =>
                            value!.isEmpty ? 'This field is required' : null,
                      ),
                    ],
                  )),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    String text = _controller.text;
                    Note note = Note(
                        noteText: text,
                        noteDate: date_manager.getCurrentDate());
                    _SaveNote(note);
                  }
                },
                child: const Text('Add Note')),
            Visibility(
              visible: notes.isEmpty,
              child: Center(
                child: Text('\nNo Notes found'),
              ),
              replacement: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: notes.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: Icon(Icons.sticky_note_2_rounded),
                    title: Text(notes[index].noteText),
                    subtitle: Text(notes[index].noteDate),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                _deleteNote(notes[index].noteId!);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                          IconButton(
                              onPressed: () {
                                _showUpdateDialog(notes[index]);
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.green,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _SaveNote(Note note) {                                              // insert
    // 1) call crud to insert
    CRUD.crud.insertNote(note).then((row) {
      
      // a) notify user
      context.ShowSnack('note saved successfully');

      // b) clear fields
      _controller.clear();

      // c) update UI
      _getNote();
    });
  }

  _getNote() {                                                        // select
    CRUD.crud.selectNote().then((value) {
      setState(() {
        notes = value;
      });
    });
  }

  void _deleteNote(int id) {                                          // delete
    CRUD.crud.deleteNote(id).then((value) {
      context.ShowSnack('note deleted successfully');
      _getNote();
    });
  }

  void updateNote(Note note) {                                        // update
    CRUD.crud.updateNote(note);
    context.ShowSnack('note Updeted successfully');
    _getNote();
  }

  _showUpdateDialog(Note note) {
    _Updatecontroller = TextEditingController(text: note.noteText);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Update Note'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () {
                    if (_Updatekey.currentState!.validate()) {
                      note.noteText = _Updatecontroller.text;
                      note.noteDate = date_manager.getCurrentDate();
                      updateNote(note);
                      Navigator.of(context).pop();
                    } else
                      _Updatekey.currentState!.validate();
                  },
                  child: Text('Update'))
            ],
            content: Form(
                key: _Updatekey,
                child: TextFormField(
                  controller: _Updatecontroller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Update',
                    prefixIcon: Icon(Icons.note_alt),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'This field is required' : null,
                )),
          );
        });
  }
}
