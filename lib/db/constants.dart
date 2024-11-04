const String databaseName = 'notes.db';
const int dbVersion = 1;

const String tablename = 'note';
const String colid = 'noteId';
const String coltext = 'noteText';
const String coldate = 'noteDate';

String createTable =
    "create table $tablename ($colid integer primary key autoincrement , $coltext text , $coldate text )";
