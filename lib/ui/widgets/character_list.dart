import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/theme/app_text_theme.dart';
import 'package:rick_and_morty/theme/color_theme.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.voilet,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: const [
            SizedBox(height: 54),
            _FindCharacterTextField(),
            _HeadLineWidget(),
            ListViewCharacters(),
          ],
        ),
      ),
    );
  }
}

class _FindCharacterTextField extends StatelessWidget {
  const _FindCharacterTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.left,
      style: const TextStyle(
        color: ColorTheme.white000,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          borderSide: BorderSide(style: BorderStyle.none),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          borderSide: BorderSide(style: BorderStyle.none),
        ),
        filled: true,
        fillColor: ColorTheme.grey,
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(15, 12, 10, 12),
          child: SvgPicture.asset(Assets.icons.search.path),
        ),
        hintText: 'Find character',
        hintStyle: AppTextTheme.body1.copyWith(color: ColorTheme.white100),
        suffixIcon: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 24,
              width: 1,
              color: ColorTheme.white100,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 12, 15, 12),
              child: SvgPicture.asset(Assets.icons.filter.path),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeadLineWidget extends StatelessWidget {
  const _HeadLineWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ALL CHARACTER: 200',
            style: AppTextTheme.subtitle2.copyWith(
              color: ColorTheme.white100,
            ),
          ),
          SvgPicture.asset(Assets.icons.sort.path),
        ],
      ),
    );
  }
}

class ListViewCharacters extends StatelessWidget {
  const ListViewCharacters({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Character> character = [
      Character(
          avatar: 'assets/images/rick_sanchez.png',
          status: 'ALIVE',
          name: 'Rick Sanchez',
          sex: 'Human, Male'),
      Character(
          avatar: 'assets/images/agency_director.png',
          status: 'ALIVE',
          name: 'Agency Director',
          sex: 'Human, Male'),
      Character(
          avatar: 'assets/images/morty_smith.png',
          status: 'ALIVE',
          name: 'Morty Smith',
          sex: 'Human, Male'),
      Character(
          avatar: 'assets/images/summer_smith.png',
          status: 'ALIVE',
          name: 'Summer Smith',
          sex: 'Human, Female'),
      Character(
          avatar: 'assets/images/albert_einstein.png',
          status: 'DEAD',
          name: 'Albert Einstein',
          sex: 'Human, Male'),
      Character(
          avatar: 'assets/images/alan_riles.png',
          status: 'DEAD',
          name: 'Alan Riles',
          sex: 'Human, Male'),
    ];

    return Expanded(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          itemCount: character.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: SizedBox(
                height: 74,
                child: Row(
                  children: [
                    Image(image: AssetImage(character[index].avatar)),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Text(
                              character[index].status,
                              style: AppTextTheme.subtitle2.copyWith(
                                color: ColorTheme.green,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Text(
                              character[index].name,
                              style: AppTextTheme.subtitle3.copyWith(
                                color: ColorTheme.white000,
                              ),
                            ),
                          ),
                          Text(
                            character[index].sex,
                            style: AppTextTheme.subtitle4.copyWith(
                              color: ColorTheme.white100,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}



// 