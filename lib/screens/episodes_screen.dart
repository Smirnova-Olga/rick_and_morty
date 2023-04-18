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
    final locale = context.l10n;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            FindTextFieldWidget(
              hintText: locale.findEpisode,
              withSuffixIcon: false,
              onSearched: (String value) {
                context.read<EpisodesBloc>().add(SearchEpisodeByName(value));
              },
            ),
            const SizedBox(height: 5),
            EpisodesListWidget(episodes: episodes),
          ],
        ),
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
                                  .copyWith(color: ColorTheme.blue900Dark),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            episodes[index].name,
                            style: AppTextTheme.subtitle3.copyWith(
                              color: ColorTheme.white000ForDark,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            episodes[index].airDate,
                            style: AppTextTheme.body2.copyWith(
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
            );
          },
        ),
      ),
    );
  }
}
