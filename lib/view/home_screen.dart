import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/view-model/todo_controller.dart';
import 'package:test_project/view/components/add_todo.dart';
import 'package:test_project/view/components/view_todo.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  TextEditingController todoTitleController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    ref.read(todoProvider.notifier).getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AddTodo(
                todoTitleController: todoTitleController,
                onPressed: () =>
                    ref.read(todoProvider.notifier).addTodo(title: todoTitleController.text.trim()),
              ),
              const Divider(),
              const ViewTodo(),
            ],
          ),
        ),
      ),
    );
  }
}
