import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/tm_appvar_screen.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final TextEditingController _titleTEController=TextEditingController();
  final TextEditingController _descriptionTEController=TextEditingController();
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppVar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Text('Add New Task',style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _titleTEController,
                  textInputAction: TextInputAction.next,
                  decoration:InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionTEController,
                  decoration:InputDecoration(
                    hintText: 'Description',
                  ),
                  maxLines: 4,
                ),
                const SizedBox(height: 36),
                FilledButton(onPressed: (){},child: Text('Add'),)
              ],
            ),
          ),
        ),
      ),
    );
  }
  void dispose(){
    _descriptionTEController.dispose();_titleTEController.dispose();
    super.dispose();
  }
}
