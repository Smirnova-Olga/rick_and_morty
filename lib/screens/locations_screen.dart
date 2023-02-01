part of '../parts/locations/locations_part.dart';

class LocationsScreen extends StatelessWidget {
  final List<Location> locations;

  const LocationsScreen({
    super.key,
    required this.locations,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.voilet,
      body: Column(children: [
        const SizedBox(
          height: 54,
        ),
        const FindTextFieldWidget(
          hintText: 'Find location',
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
          child: _HeadLineWidget(locationsCount: locations.length),
        ),
        LocationListWidget(
          locations: locations,
        )
      ]),
    );
  }
}

class _HeadLineWidget extends StatelessWidget {
  final int locationsCount;
  const _HeadLineWidget({
    Key? key,
    required this.locationsCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'ALL LOCATIONS: $locationsCount',
          style: AppTextTheme.subtitle2.copyWith(
            color: ColorTheme.white100,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}

class LocationListWidget extends StatelessWidget {
  final List<Location> locations;
  const LocationListWidget({
    super.key,
    required this.locations,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: Container(
                height: 218,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: ColorTheme.blue700,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image(
                      image: AssetImage(Assets.images.earth.path),
                      fit: BoxFit.fitWidth,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 26, 5),
                      child: Text(
                        locations[index].name,
                        style: AppTextTheme.headline6
                            .copyWith(color: ColorTheme.white000),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        '${locations[index].type}, ${locations[index].dimension}',
                        style: AppTextTheme.subtitle4
                            .copyWith(color: ColorTheme.white100),
                      ),
                    ),
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
