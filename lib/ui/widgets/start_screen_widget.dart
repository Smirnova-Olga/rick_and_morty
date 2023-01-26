import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/theme/color_theme.dart';
import 'package:rick_and_morty/ui/widgets/character_list.dart';

class StartScreenWidget extends StatefulWidget {
  const StartScreenWidget({super.key});

  @override
  State<StartScreenWidget> createState() => _StartScreenWidgetState();
}

class _StartScreenWidgetState extends State<StartScreenWidget> {
  int _selectedTab = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    CharacterList(),
    Text(
      'Locations',
    ),
    Text(
      'Episodes',
    ),
    Text(
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
