
import 'package:test_project/model/todo_model.dart';

class TodoGeneric {
  List<Todo>? todos;

  TodoGeneric({this.todos = const []});

  TodoGeneric update({List<Todo>? todoList}){
    return TodoGeneric(todos: todoList ?? this.todos);
  }
}