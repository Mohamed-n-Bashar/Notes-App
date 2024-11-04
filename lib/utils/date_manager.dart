class date_manager{
  static String getCurrentDate (){
    DateTime dateTime = DateTime.now();
    return '${dateTime.day}-${dateTime.month}-${dateTime.year}\n${dateTime.hour}:${dateTime.minute}';
  }
}