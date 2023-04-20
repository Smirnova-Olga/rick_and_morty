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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 3),
            FindTextFieldWidget(
              hintText: locale.findLocation,
              withSuffixIcon: true,
              onSearched: (String value) {
                context.read<LocationsBloc>().add(SearchLocationByName(value));
              },
            ),
            _HeadLineWidget(locationsCount: locations.length),
            LocationListWidget(
              locations: locations,
            )
          ],
        ),
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
              color: ColorTheme.white100Dark,
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
            return Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Container(
                height: 218,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: ColorTheme.greyDark,
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
                            .copyWith(color: ColorTheme.white100Dark),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        '${locations[index].type}, ${locations[index].dimension}',
                        style: AppTextTheme.subtitle4
                            .copyWith(color: ColorTheme.white100Dark),
                        overflow: TextOverflow.ellipsis,
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
