import 'package:flutter/material.dart';
import 'package:helpful_flutter/ui/contollers/auth_contoller.dart';
import 'package:helpful_flutter/ui/screen/login_screen.dart';
import 'package:helpful_flutter/ui/screen/update_screen.dart';

class TMAppVar extends StatefulWidget implements PreferredSizeWidget {
  const TMAppVar({super.key, this.fromUpdateProfile = false});

  final bool fromUpdateProfile;

  @override
  State<TMAppVar> createState() => _TMAppVarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TMAppVarState extends State<TMAppVar> {
  @override
  Widget build(BuildContext context) {
    final user = AuthContoller.userModel;

    return AppBar(
      backgroundColor: Colors.green,
      title: InkWell(
        onTap: widget.fromUpdateProfile
            ? null
            : () => Navigator.push(context, MaterialPageRoute(builder: (_) => const UpdateScreen())),
        borderRadius: BorderRadius.circular(24),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(child: Icon(Icons.person)),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user?.fullName ?? 'User',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
                ),
                Text(
                  user?.email ?? '',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        IconButton(onPressed: _signOut, icon: const Icon(Icons.logout)),
      ],
    );
  }

  Future<void> _signOut() async {
    await AuthContoller.clearUserData();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
          (_) => false,
    );
  }
}
