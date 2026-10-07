import 'package:flutter/material.dart';
import '../widget/tm_appvar_screen.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final _titleTEController = TextEditingController();
  final _descriptionTEController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppVar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text('Add New Task', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              TextFormField(
                controller: _titleTEController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: 'Title'),
                validator: (value) => value?.trim().isEmpty ?? true ? 'Enter a task title' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionTEController,
                decoration: const InputDecoration(hintText: 'Description'),
                maxLines: 4,
                validator: (value) => value?.trim().isEmpty ?? true ? 'Enter a task description' : null,
              ),
              const SizedBox(height: 36),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _addTask,
                  child: const Text('Add'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addTask() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    Navigator.pop(context, {
      'title': _titleTEController.text.trim(),
      'description': _descriptionTEController.text.trim(),
    });
  }

  @override
  void dispose() {
    _descriptionTEController.dispose();
    _titleTEController.dispose();
    super.dispose();
  }
}
