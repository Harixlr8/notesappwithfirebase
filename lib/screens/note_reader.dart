import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesappwithfirebase/styles/app_styles.dart';

class NoteTeaderScreen extends StatefulWidget {
  NoteTeaderScreen(this.doc, {super.key});
  QueryDocumentSnapshot doc;
  @override
  State<NoteTeaderScreen> createState() => _NoteTeaderScreenState();
}

class _NoteTeaderScreenState extends State<NoteTeaderScreen> {
  final _db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];

    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        color: Colors.black,
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          // color: AppStyle.cardColors[color_id].withOpacity(0.8),
          child: Scaffold(
            backgroundColor: AppStyle.cardColors[color_id],
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Material(
                      child: InkWell(
                        child: const Icon(
                          Icons.close,
                          size: 30,
                        ),
                        onTap: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NoteTeaderScreen(widget.doc),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(widget.doc['note_title'],
                    style: GoogleFonts.nunito(
                      fontSize: 25,
                      color: Colors.black,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Text(widget.doc['creation_date'],
                    style: GoogleFonts.nunito(
                      fontSize: 15,
                      color: Colors.black,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.doc['note_content'],
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                FloatingActionButton.extended(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                            'Are you sure You want to delete this note'),
                        // content: const Text('AlertDialog description'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () async {
                              await _db
                                  .collection("note").doc('').delete();

                              // await deleteNote(widget.doc.data.docs[Index].id);
                              // FirebaseFirestore.instance.runTransaction(
                              //     (Transaction myTransaction) async {
                              //   myTransaction.delete(widget.doc[color_id]);
                              // });
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete_outline),
                  label: const Text(
                    'Delete this\nNote',
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void deleteNote(id) {
    FirebaseFirestore.instance.collection('note').doc(id).delete();
  }
}
