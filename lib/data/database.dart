import 'package:hive_flutter/hive_flutter.dart';

class toDoDatabase {
  List toDoList = [];
  final _myBox  = Hive.box('mybox');
  void createInitialData() {
    toDoList = [
      ["make tutorial", false],
      ["do exercise", true]
    ];
  }
  void loadData (){
      toDoList = _myBox.get('TODOLIST');
    }
    void updateDataBase (){
      _myBox.put('TODOLIST', toDoList);
  }
}