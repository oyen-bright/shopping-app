import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/chat.dart';
import 'package:shopping_app/cubit/hidebottomnav_cubit.dart';
import 'package:shopping_app/favorite.dart';
import 'package:shopping_app/home.dart';
import 'package:shopping_app/profile.dart';

class ButtomNavigation extends StatefulWidget {
  const ButtomNavigation({super.key});

  @override
  State<ButtomNavigation> createState() => _ButtomNavigationState();
}

class _ButtomNavigationState extends State<ButtomNavigation> {
  List<Map<String, dynamic>> bottomItem = [
    {"Icon": FontAwesomeIcons.shop, "lable": "Shop"},
    {"Icon": FontAwesomeIcons.heart, "lable": "Favorite"},
    {"Icon": FontAwesomeIcons.message, "lable": "Help"},
    {"Icon": FontAwesomeIcons.user, "lable": "Profile"},
  ];

  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    const Home(),
    const Favorite(),
    const Chat(),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BlocBuilder<HidebottomnavCubit, HidebottomnavState>(
        builder: (context, state) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            height: state.hidebottomNav ? 0 : null,
            child: BottomNavigationBar(
              showSelectedLabels: true,
              showUnselectedLabels: false,
              elevation: 0,
              selectedFontSize: 12,
              type: BottomNavigationBarType.fixed,
              unselectedFontSize: 12,
              backgroundColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.black,
              unselectedIconTheme:
                  const IconThemeData(color: Colors.grey, size: 25),
              selectedIconTheme:
                  const IconThemeData(color: Colors.black, size: 25),
              items: bottomItem
                  .map(
                    (e) => BottomNavigationBarItem(
                      backgroundColor: Colors.white,
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            FaIcon(e["Icon"]),
                            // 10.height,
                            // Container(
                            //   height: 7,
                            //   width: 7,
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(100)),
                            // )
                          ],
                        ),
                      ),
                      label: "",
                    ),
                  )
                  .toList(),
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          );
        },
      ),
    );
  }
}
