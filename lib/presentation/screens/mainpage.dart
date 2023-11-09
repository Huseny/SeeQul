import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:seequl/presentation/components/post_components/custom_appbar.dart';
import 'package:seequl/presentation/screens/homepage.dart';
import 'package:seequl/presentation/screens/organize_page.dart';
import 'package:seequl/presentation/screens/profile_page.dart';
import 'package:seequl/presentation/screens/qucon_page.dart';
import 'package:seequl/presentation/screens/zaady_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.username, this.profileImageUrl});

  final String username;
  final String? profileImageUrl;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isHidden = false;
  int _selectedPageIndex = 0;

  void changeSelectedPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(
        onHide: () {
          setState(() {
            _isHidden = !_isHidden;
          });
        },
      ),
      const Qucon(),
      const Zaady(),
      const Organize(),
      const Profile(),
    ];
    return Scaffold(
      appBar: const CustomAppBar(
        name: "SeeQul",
      ),
      body: pages[_selectedPageIndex],
      bottomNavigationBar: _isHidden != true
          ? BottomNavigationBar(
              backgroundColor: const Color.fromRGBO(46, 46, 46, 1),
              selectedItemColor: const Color.fromRGBO(255, 221, 94, 1),
              unselectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedPageIndex,
              onTap: changeSelectedPage,
              items: const [
                  BottomNavigationBarItem(
                      icon: Icon(LineAwesomeIcons.home), label: "Apps"),
                  BottomNavigationBarItem(
                      icon: Icon(LineAwesomeIcons.video_1), label: "Qucon"),
                  BottomNavigationBarItem(
                      icon: Icon(LineAwesomeIcons.robot), label: "Zaady"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.send), label: "Organize"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "Profile"),
                ])
          : null,
    );
  }
}
