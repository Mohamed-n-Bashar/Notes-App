import 'package:local_database/db/constants.dart';

class Note{
  int? noteId ;
  String noteText = '';
  String noteDate = '';

  Note({this.noteId , required this.noteText , required this.noteDate});

  Map<String,dynamic> toMap(){
    return {colid:noteId , coltext:noteText , coldate:noteDate};                    // Serialization
  }
  Note.fromMap(Map<String,dynamic> map) {                                           // Deserialization  (Named Constructor)
    noteId = map[colid];
    noteText = map[coltext];
    noteDate = map[coldate];
  }

  //                            ||
  //                           \  /         نفس الحاجة ولكن اللي فيها factory افضل كمان 
  //                            \/

  // factory Note.fromMap(Map<String,dynamic> map) {
  //   return Note(noteId: map[colid], noteText: map[coltext], noteDate: map[coldate]);
  // }
}