import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';
import 'package:rick_and_morty/parts/characters/characters_part.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const CharactersPart(),
    const Text(
      'Locations',
    ),
    const Text(
      'Episodes',
    ),
    const Text(
      'Settings',
    ),
  ];

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.voilet,
      body: Center(
        child: _widgetOptions[_selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.character.path),
            label: 'Characters',
            backgroundColor: ColorTheme.grey,
            activeIcon: SvgPicture.asset(
              Assets.icons.character.path,
              color: ColorTheme.green,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.location.path),
            label: 'Locations',
            backgroundColor: ColorTheme.grey,
            activeIcon: SvgPicture.asset(
              Assets.icons.location.path,
              color: ColorTheme.green,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.episode.path),
            label: 'Episodes',
            backgroundColor: ColorTheme.grey,
            activeIcon: SvgPicture.asset(
              Assets.icons.episode.path,
              color: ColorTheme.green,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.settings.path),
            label: 'Settings',
            backgroundColor: ColorTheme.grey,
            activeIcon: SvgPicture.asset(
              Assets.icons.settings.path,
              color: ColorTheme.green,
            ),
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
