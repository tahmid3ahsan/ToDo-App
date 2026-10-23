import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todotile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}



class _HomepageState extends State<Homepage> {
  final _mybox = Hive.box('mybox');
  toDoDatabase db = toDoDatabase();

  @override
  void initState() {
    if(_mybox.get("TODOLIST") == null){
      db.createInitialData();
    } else {
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }

  //Easiest method so far
  void deleteTask(String task){
    db.toDoList.remove(task);
    db.updateDataBase();
  }
  //Yes i wonder what the controller is
  void saveNewTask(){
     setState(() {
       db.toDoList.add([_controller.text, false]);
       _controller.clear();
     });
     Navigator.of(context).pop();
     db.updateDataBase();
  }
  //text controller (I gotta know how ts works ngl)
  final _controller = TextEditingController();

  void createNewTask() {
  showDialog(context: context, builder: (context) {
      return DialogBox(
        controller: _controller,
        //brought up from button dialog ngl it was easy too
        onCancel: Navigator.of(context).pop,
        onSave: saveNewTask,
      );
    },
  );
}
  //I made it myself kinda proud of me
  void taskDelete(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
      db.updateDataBase();
  }
  //so basically the q mark means it can be bool or not i don give a fk, but gotta review the code again. oh if its on turn it off vice versa
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  }

  //and yeah frontend shits
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.green[200],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Todo App"),
        ),
        floatingActionButton:
         FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
          ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              deleteFunction: (context) => taskDelete(index),
              taskName: db.toDoList[index][0],
              onChanged: (Value) => checkBoxChanged(Value, index),
              taskCompleted: db.toDoList[index][1],
            );
          },
        ),
    );
  }
}