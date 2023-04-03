part of '../parts/locations/locations_part.dart';

class LocationsScreen extends StatelessWidget {
  final List<Location> locations;

  const LocationsScreen({
    super.key,
    required this.locations,
  });

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;
    return Scaffold(
      backgroundColor: ColorTheme.voilet,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          FindTextFieldWidget(
            hintText: locale.findLocation,
            withSuffixIcon: true,
          ),
          _HeadLineWidget(locationsCount: locations.length),
          LocationListWidget(
            locations: locations,
          )
        ]),
      ),
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
    final locale = context.l10n;
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Text(
            locale.allLocationsCount(locationsCount),
            style: AppTextTheme.subtitle2.copyWith(
              color: ColorTheme.white100,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
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
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
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
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          '${locations[index].type}, ${locations[index].dimension}',
                          style: AppTextTheme.subtitle4
                              .copyWith(color: ColorTheme.white100),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
