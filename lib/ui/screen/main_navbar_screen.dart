import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpful_flutter/ui/screen/new_task_screen.dart';
import 'package:helpful_flutter/ui/screen/progress_var_screen.dart';
import '../widget/tm_appvar_screen.dart';

class MainNavbarScreen extends StatefulWidget {
  const MainNavbarScreen({super.key});

  @override
  State<MainNavbarScreen> createState() => _MainNavbarScreenState();
}

class _MainNavbarScreenState extends State<MainNavbarScreen>{
  int _selectedIndex=0;
  final List<Widget>_screens=[
    NewTaskScreen(),
    ProgressVarScreen(),
    ProgressVarScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppVar(),
        body: _screens[_selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        )
    );
  }
}


