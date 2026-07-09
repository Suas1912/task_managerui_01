import 'package:flutter/material.dart';
import '../widget/task_card.dart';
import '../widget/task_count_var.dart';
import 'add_new_task.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: ListView.separated(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TaskCountByStatusvar(title: 'New', Count: 2);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 8);
                },
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return TaskCard();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 8);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapFloatingButton,
        child: Icon(Icons.add),
      ),
    );
  }
  void _onTapFloatingButton(){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>AddNewTask()));
  }
}

