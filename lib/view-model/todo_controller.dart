import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/model/todo_model.dart';
import 'package:test_project/view-model/todo_generic.dart';

final todoProvider = StateNotifierProvider<TodoController, TodoGeneric>((ref) => TodoController(ref));

class TodoController extends StateNotifier<TodoGeneric> {
  TodoController(this.ref) : super(TodoGeneric());
  Ref ref;

  addTodo({required String title}) async {
    Todo todo = Todo();
    todo.title = title;
    await todo.save();
    await getTodos();
  }

  getTodos() async {
    List<Todo> todos = await Todo().select().toList();
    state = state.update(todoList: todos);
  }

  updateTodo({required Todo todo}) async {
    todo.isDone = !todo.isDone!;
    todo.upsert();
    await getTodos();
  }
}
