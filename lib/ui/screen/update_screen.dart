import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpful_flutter/ui/widget/tm_appvar_screen.dart';
import 'package:image_picker/image_picker.dart';
import '../widget/photo_button.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}
class _UpdateScreenState extends State<UpdateScreen> {

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstnameTEController = TextEditingController();
  final TextEditingController _lastTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final ImagePicker _imagePicker=ImagePicker();
  XFile? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppVar(
        fromUpdateProfile: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24,),
                Text('Update Profile',style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 16),
                PhotoButton(
                  onTap:_pickImage,
                  selectedPhoto: _selectedImage,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailTEController,
                  decoration: InputDecoration(hintText: "Email"),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _firstnameTEController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "First Name"),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _lastTEController,
                  decoration: InputDecoration(hintText: "Last Name"),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _mobileTEController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Phone Number"),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordTEController,
                  decoration: InputDecoration(hintText: "Password"),
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: (){},
                  child: Text('Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _pickImage() async{
    XFile? pickedImage =await _imagePicker.pickImage(source: ImageSource.gallery);
    if(pickedImage != null){
      _selectedImage=pickedImage;
      setState(() {});
    }
  }
  @override
  void dispose(){
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _mobileTEController.dispose();
    _lastTEController.dispose();
    _firstnameTEController.dispose();
    super.dispose();
  }
}

