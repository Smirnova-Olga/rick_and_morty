// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../parts/characters/characters_part.dart';

class CharactersScreen extends StatelessWidget {
  final List<Character> characters;
  final bool isList;
  const CharactersScreen({
    Key? key,
    required this.characters,
    required this.isList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.voilet,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 54),
            const FindTextFieldWidget(
              hintText: 'Find character',
            ),
            _HeadLineWidget(
              isList: isList,
            ),
            ViewCharacters(
              characters: characters,
              isList: isList,
            ),
          ],
        ),
      ),
    );
  }
}

class _HeadLineWidget extends StatelessWidget {
  final bool isList;
  const _HeadLineWidget({
    required this.isList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ALL CHARACTER: ${characters.length.toString()}',
            style: AppTextTheme.subtitle2.copyWith(
              color: ColorTheme.white100,
            ),
          ),
          IconButton(
            icon: SvgPicture.asset(
                isList ? Assets.icons.sort.path : Assets.icons.list.path),
            onPressed: () => context.read<CharactersBloc>().add(
                  CharactersViewSwitched(),
                ),
          ),
        ],
      ),
    );
  }
}

class ViewCharacters extends StatelessWidget {
  final List<Character> characters;
  final bool isList;
  const ViewCharacters({
    Key? key,
    required this.characters,
    required this.isList,
  }) : super(key: key);

  final String alive = 'ALIVE';

  final String dead = 'DEAD';

  @override
  Widget build(BuildContext context) {
    return isList
        ? ListWidget(character: characters, alive: alive)
        : GridWidget(character: characters, alive: alive);
  }
}

class GridWidget extends StatelessWidget {
  const GridWidget({
    Key? key,
    required this.character,
    required this.alive,
  }) : super(key: key);

  final List<Character> character;
  final String alive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 200,
            mainAxisSpacing: 20,
            crossAxisSpacing: 30,
          ),
          itemCount: character.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                const SizedBox(
                  width: 120,
                  height: 122,
                  //  TODO child: Image(
                  //   image: AssetImage(character[index].avatar),
                  //   fit: BoxFit.fill,
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    character[index].status,
                    style: AppTextTheme.subtitle2.copyWith(
                      color: character[index].status == alive
                          ? ColorTheme.green
                          : ColorTheme.red,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    character[index].name,
                    style: AppTextTheme.subtitle5.copyWith(
                      color: ColorTheme.white000,
                    ),
                  ),
                ),
                Text(
                  '',
                  // TODO character[index].sex,
                  style: AppTextTheme.subtitle4.copyWith(
                    color: ColorTheme.white100,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget({
    Key? key,
    required this.character,
    required this.alive,
  }) : super(key: key);

  final List<Character> character;
  final String alive;

  @override
  Widget build(BuildContext context) {
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
                    // TODO Image(image: AssetImage(character[index].avatar)),
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
                                color: character[index].status == alive
                                    ? ColorTheme.green
                                    : ColorTheme.red,
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
                            '',
                            // TODO character[index].sex,
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
