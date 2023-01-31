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
      body: Column(children: const [
        SizedBox(
          height: 54,
        ),
        FindTextFieldWidget(
          hintText: 'Find episode',
        ),
        SizedBox(
          height: 5,
        ),
      ]),
    );
  }
}
