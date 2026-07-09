import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpful_flutter/ui/screen/update_screen.dart';

class TMAppVar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppVar({
    super.key, this.fromUpdateProfile,
  });
  final bool? fromUpdateProfile;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: (){
          if(fromUpdateProfile ?? false){
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
        IconButton(onPressed: (){},icon: Icon(Icons.logout),),
      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}