import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpful_flutter/ui/contollers/auth_contoller.dart';
import 'package:helpful_flutter/ui/screen/login_screen.dart';
import 'package:helpful_flutter/ui/screen/update_screen.dart';

class TMAppVar extends StatefulWidget implements PreferredSizeWidget {
  const TMAppVar({
    super.key, this.fromUpdateProfile,
  });
  final bool? fromUpdateProfile;

  @override
  State<TMAppVar> createState() => _TMAppVarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _TMAppVarState extends State<TMAppVar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: (){
          if(widget.fromUpdateProfile ?? false){
            return;
          }
          Navigator.push(context,MaterialPageRoute(builder: (context)=>UpdateScreen()));
        },
        child: Row(
          spacing: 4,
          children: [
            CircleAvatar(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sakib Hossen",style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white)),
                Text("suasm1992@gmail.com",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
      actions: [
        IconButton(onPressed:_signOut,icon: Icon(Icons.logout),),
      ],
    );
  }
  Future<void> _signOut() async {
    await AuthContoller.clearUserData();
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
  }
}