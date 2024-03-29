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
    final locale = context.l10n;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 3),
            FindTextFieldWidget(
              hintText: locale.findCharacter,
              withSuffixIcon: true,
              onSearched: (String value) {
                context
                    .read<CharactersBloc>()
                    .add(SearchCharacterByName(value));
              },
            ),
            _HeadLineWidget(
              isList: isList,
              charactersCount: characters.length,
            ),
            Expanded(
              child: ViewCharacters(
                characters: characters,
                isList: isList,
              ),
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
    final locale = context.l10n;
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            locale.allCharactersCount(charactersCount),
            style: AppTextTheme.subtitle2.copyWith(
              color: ColorTheme.white100Dark,
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

  @override
  Widget build(BuildContext context) {
    return isList
        ? ListWidget(character: characters)
        : GridWidget(character: characters);
  }
}

class GridWidget extends StatelessWidget {
  const GridWidget({
    Key? key,
    required this.character,
  }) : super(key: key);

  final List<Character> character;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
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
                        ? ColorTheme.greenDark
                        : ColorTheme.redDark,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  character[index].name,
                  style: AppTextTheme.subtitle5.copyWith(
                    color: ColorTheme.white100Dark,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${character[index].species}, ${character[index].gender}',
                style: AppTextTheme.subtitle4.copyWith(
                  color: ColorTheme.white100Dark,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        },
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
    return SizedBox(
      height: MediaQuery.of(context).size.height,
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
                  Expanded(
                    child: Padding(
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
                                    ? ColorTheme.greenDark
                                    : ColorTheme.redDark,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Text(
                              character[index].name,
                              style: AppTextTheme.subtitle3.copyWith(
                                color: ColorTheme.white100Dark,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            '${character[index].species}, ${character[index].gender}',
                            style: AppTextTheme.subtitle4.copyWith(
                              color: ColorTheme.white100Dark,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
