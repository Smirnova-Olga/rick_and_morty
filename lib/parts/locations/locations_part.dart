library locations_part;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/parts/locations/mock_data/mock_data.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';

part 'bloc/locations_bloc.dart';
part 'bloc/locations_event.dart';
part 'bloc/locations_state.dart';
part 'locations_screen.dart';
part 'models/location.dart';

class LocationsPart extends StatelessWidget {
  const LocationsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationsBloc>(
      create: (context) => LocationsBloc()..add(LocationsOpened()),
      child: BlocBuilder<LocationsBloc, LocationsState>(
        builder: (context, state) {
          if (state is LocationsLoadFailure) {
            return Container();
          } else if (state is LocationsLoadSuccess) {
            return LocationsScreen(locations: state.locations);
          } else {
            return const AppLoadingScreen();
          }
        },
      ),
    );
  }
}
