import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

import 'models/note_page.dart';
import 'models/note_page_data.dart';

class EditingNotePage extends StatefulWidget {
  Note note;
  bool isNewNote;
  EditingNotePage({super.key, required this.isNewNote,required this.note});

  @override
  State<EditingNotePage> createState() => _EditingNotePageState();
}

class _EditingNotePageState extends State<EditingNotePage> {

  QuillController _controller =  QuillController.basic();
  

  @override
  void initState() {
    super.initState();
    loadExistingNote();
    
  }
void loadExistingNote(){
  final doc = Document()..insert(0,widget.note.text,);
  setState(() {
    _controller = QuillController(document: doc, selection: const TextSelection.collapsed(offset: 0));
  });
}

void addNewNote(){
  int id = Provider.of<NoteData>(context,listen: false)
      .getAllNotes().length;
  String text = _controller.document.toPlainText();
  Provider.of<NoteData>(context, listen: false).addNewNote(Note(
    id: id, text: text
    ));
}

void updateNote(){
  String text = _controller.document.toPlainText();
  Provider.of<NoteData>(context, listen: false).updateNote(widget.note, text);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: Icon(Icons.arrow_back),color: Colors.black, onPressed: () {
          if(widget.isNewNote && !_controller.document.isEmpty()){
            addNewNote();
          }
          // else{
          //   updateNote();
          // }
        Navigator.pop(context);
        },
        ),
      ),


      body: Column(
        children: [

          // Toolbarda bazı sıkıntılar olduğu için kaldırıldı.

          // QuillToolbar.basic(
          //   controller: _controller,
          //   showAlignmentButtons: false,
          //   showBackgroundColorButton: false,
          //   showCenterAlignment: false,
          //   showColorButton: false,
          //   showCodeBlock: false,
          //   showDirection: false,
          //   showFontFamily: false,
          //   showDividers: false,
          //   showIndent: false,
          //   showHeaderStyle: false,
          //   showLink: false,
          //   showSearchButton: false,
          //   showInlineCode: false,
          //   showQuote: false,
          //   showListNumbers: false,
          //   showListBullets: false,
          //   showClearFormat: false,
          //   showBoldButton: false,
          //   showFontSize: false,
          //   showItalicButton: false,
          //   showUnderLineButton: false,
          //   showStrikeThrough: false,
          //   showListCheck: false,
          //   ),

          Expanded(
            child: Container(
              padding: EdgeInsets.all(25),
              child: QuillEditor.basic(controller: _controller, readOnly: false),
              )
              ),
          Padding(
            padding: const EdgeInsets.only(
              left: 280,
              bottom: 30,
              ),
            child: FloatingActionButton(
              onPressed: (){
                if(widget.isNewNote && !_controller.document.isEmpty()){
                  addNewNote();
                } else{
                    updateNote();
                }
                Navigator.pop(context);
              },
              backgroundColor: const Color(0xff0F9D58),
              child:
              const Icon(
                Icons.add_comment,
                color: Color(0xffF4B400)),
              ),
          ),
        ],
      ),
    );
  }
}