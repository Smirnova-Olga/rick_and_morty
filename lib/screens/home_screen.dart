part of '../parts/home/home_part.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const CharactersPart(),
    const LocationsPart(),
    const EpisodesPart(),
  ];

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.voilet,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
            icon: SvgPicture.asset(Assets.icons.settings.path),
          ),
        ],
      ),
      backgroundColor: ColorTheme.voilet,
      body: Center(
        child: _widgetOptions[_selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.character.path),
            label: locale.characters,
            activeIcon: SvgPicture.asset(
              Assets.icons.character.path,
              color: ColorTheme.green,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.location.path),
            label: locale.locations,
            activeIcon: SvgPicture.asset(
              Assets.icons.location.path,
              color: ColorTheme.green,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.episode.path),
            label: locale.episodes,
            activeIcon: SvgPicture.asset(
              Assets.icons.episode.path,
              color: ColorTheme.green,
            ),
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
