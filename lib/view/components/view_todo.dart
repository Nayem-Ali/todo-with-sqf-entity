import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/model/todo_model.dart';
import 'package:test_project/view-model/todo_controller.dart';

class ViewTodo extends ConsumerStatefulWidget {
  const ViewTodo({super.key});
  @override
  ConsumerState<ViewTodo> createState() => _ViewTodoState();
}

class _ViewTodoState extends ConsumerState<ViewTodo> {
  @override
  Widget build(BuildContext context) {
    final todoController = ref.watch(todoProvider);
    return Expanded(
      child: ListView.builder(
        itemCount: todoController.todos?.length ?? 0,
        itemBuilder: (context, index) {
          Todo todo = todoController.todos![index];
          return Card(
            child: ListTile(
                leading: CircleAvatar(child: Text(todo.id.toString())),
                title: Text(todo.title.toString()),
                trailing: Checkbox(
                  value: todo.isDone,
                  onChanged: (value) async {
                    await ref.read(todoProvider.notifier).updateTodo(todo: todo);
                  },
                )),
          );
        },
      ),
    );
  }
}
