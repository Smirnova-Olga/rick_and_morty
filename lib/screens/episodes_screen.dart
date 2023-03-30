// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../parts/episodes/episodes_part.dart';

class EpisodesScreen extends StatelessWidget {
  final List<Episode> episodes;

  const EpisodesScreen({
    Key? key,
    required this.episodes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.voilet,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          const SizedBox(
            height: 54,
          ),
          const _FindTextFieldWidget(
            hintText: 'Find episode',
          ),
          const SizedBox(
            height: 5,
          ),
          EpisodesListWidget(episodes: episodes),
        ]),
      ),
    );
  }
}

class _FindTextFieldWidget extends StatelessWidget {
  final String hintText;
  const _FindTextFieldWidget({
    Key? key,
    required this.hintText,
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
        hintText: hintText,
        hintStyle: AppTextTheme.body1.copyWith(color: ColorTheme.white100),
      ),
    );
  }
}

class EpisodesListWidget extends StatelessWidget {
  final List<Episode> episodes;
  const EpisodesListWidget({
    super.key,
    required this.episodes,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          itemCount: episodes.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                children: [
                  Image(image: AssetImage(Assets.images.episodeImage.path)),
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
                              episodes[index].episode,
                              style: AppTextTheme.overline
                                  .copyWith(color: ColorTheme.blue900),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            episodes[index].name,
                            style: AppTextTheme.subtitle3.copyWith(
                              color: ColorTheme.white000,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            episodes[index].airDate,
                            style: AppTextTheme.body2.copyWith(
                              color: ColorTheme.white100,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
