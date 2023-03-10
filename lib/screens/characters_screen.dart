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
              charactersCount: characters.length,
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
  final int charactersCount;
  final bool isList;
  const _HeadLineWidget({
    required this.isList,
    required this.charactersCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ALL CHARACTER: $charactersCount',
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
        ? ListWidget(character: characters)
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
                SizedBox(
                  width: 120,
                  height: 122,
                  child: ClipOval(child: Image.network(character[index].image)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    character[index].status.toUpperCase(),
                    style: AppTextTheme.subtitle2.copyWith(
                      color: character[index].status == 'Alive'
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
                  '${character[index].species}, ${character[index].gender}',
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
  }) : super(key: key);

  final List<Character> character;

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
                    ClipOval(child: Image.network(character[index].image)),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Text(
                              character[index].status.toUpperCase(),
                              style: AppTextTheme.subtitle2.copyWith(
                                color: character[index].status == 'Alive'
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
                            '${character[index].species}, ${character[index].gender}',
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
