import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskCountByStatusvar extends StatelessWidget {
  const TaskCountByStatusvar({
    super.key, required this.title, required this.Count,
  });
  final String title;
  final int Count;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 16),
        child: Column(
          children: [
            Text('$Count',style: Theme.of(context).textTheme.titleLarge,),
            Text(title,style: TextStyle(color: Colors.grey),),
          ],
        ),
      ),
    );
  }
}
