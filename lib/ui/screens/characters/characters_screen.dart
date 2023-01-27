// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'characters.dart';

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
            const _FindCharacterTextField(),
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
  final bool isList;
  const _HeadLineWidget({
    required this.isList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ALL CHARACTER: 200',
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
                SizedBox(
                  width: 120,
                  height: 122,
                  child: Image(
                    image: AssetImage(character[index].avatar),
                    fit: BoxFit.fill,
                  ),
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
                  character[index].sex,
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
