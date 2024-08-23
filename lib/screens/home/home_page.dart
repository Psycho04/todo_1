import 'package:flutter/material.dart';
import 'package:todo_1/widgets/bottom_sheet_widget.dart';
import 'package:todo_1/screens/home/menu/menu_page.dart';
import 'package:todo_1/screens/home/settings/settings.dart';
import 'package:todo_1/core/themes/light.dart';
class HomePage extends StatefulWidget {
  static const String routeName = 'HomePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List taps = [
    const Menu(),
    const Settings()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: taps[currentIndex],
      floatingActionButton: FloatingActionButton( 
        backgroundColor: MyLightTheme.primaryblue,
        shape: const CircleBorder(side: BorderSide(color: Colors.white, width: 3)),
        onPressed: ()async{
          await AddBottomSheet.show(context);
        },
        child: Icon(Icons.add,color: Theme.of(context).colorScheme.onSecondary,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 20,
        color: Theme.of(context).colorScheme.onPrimary,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list),label: "menu"),
            BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label: "settings")
          ]
          ),
      ),
    );
  }
}
