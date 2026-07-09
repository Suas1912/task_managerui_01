import 'package:flutter/material.dart';
import '../widget/task_card.dart';

class ProgressVarScreen extends StatefulWidget {
  const ProgressVarScreen({super.key});

  @override
  State<ProgressVarScreen> createState() => _ProgressVarScreenState();
}

class _ProgressVarScreenState extends State<ProgressVarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
          child:Expanded(
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

      ),
    );
  }
}

