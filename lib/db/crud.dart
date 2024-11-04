import 'package:local_database/db/DbHelper.dart';
import 'package:local_database/db/constants.dart';
import 'package:sqflite/sqflite.dart';
import '../modal/note.dart';

class CRUD {
  CRUD._();
  static final CRUD crud = CRUD._();

  // insert
Future<int> insertNote(Note note) async {
  Database db = await DbHelper.helper.CreateOrOpen();
  return db.insert(tablename, note.toMap());                                                       // = db.rawInsert(هنا جملة سيكوال sql) 
}

  // select
Future<List<Note>> selectNote()async{
  Database db = await DbHelper.helper.CreateOrOpen();
  List<Map<String,dynamic>> result = await db.query(tablename, orderBy: '$coldate desc');         // = db.rawSelect(هنا جملة سيكوال sql) 
  return result.map((e) => Note.fromMap(e)).toList();
}

  // delete   
Future<int> deleteNote(int id)async{
  Database db = await DbHelper.helper.CreateOrOpen();
  return await db.delete(
    tablename,                                                                                    // = db.rawDelete(هنا جملة سيكوال sql) 
    where: '$colid=?',                // =? دي معناها ان في باراميتر هييجي بعد علامة الاستفهام دي وهيكون ال id اللي هيتمسح
    whereArgs: [id],                  // هنا بقي القيمة اللي هتتبعت بعد علامة الاستفهام
   );
}

  // update
Future<int> updateNote(Note note)async{
  Database db = await DbHelper.helper.CreateOrOpen();
  return await db.update(                                                                         // = db.rawUpdate(هنا جملة سيكوال sql) 
    tablename,
    note.toMap(),
    where: '$colid=?',
    whereArgs: [note.noteId]
     );
}
}