import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notesappwithfirebase/styles/app_styles.dart';

class NewNoteScreen extends StatefulWidget {
   NewNoteScreen({super.key});
  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  


  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String date = DateTime.now().toString();
  int color_id = Random().nextInt(AppStyle.cardColors.length);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppStyle.cardColors[color_id],
          elevation: 0,
          title: const Text(
            'Add a new Note',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.center,
            child: Container(
              color: AppStyle.cardColors[color_id],
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Note Title'),
                    style: AppStyle.mainTitle,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The note title is mandatory';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _contentController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type the notes here'),
                    style: AppStyle.mainTitle,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some Notes';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "The recorded occurance of new note is at $date",
                    style: AppStyle.dateTitle,
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () async {
            if (_formKey.currentState!.validate()==true) {
             

              FirebaseFirestore.instance.collection('note').add({
                'note_title': _titleController.text,
                'creation_date': date,
                'note_content': _contentController.text,
                "color_id": color_id,
              }).then((value) {
                Navigator.pop(context);
              }).catchError(
                (error) => print('Failed to add note due to  $error'),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('New Note Added')),
                  );
            }
          },
        ),
      ),
    );
  }
}
