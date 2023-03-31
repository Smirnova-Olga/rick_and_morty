library locations_part;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/domain/api_clients/api_client.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/l10n/l10n.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';
part 'bloc/locations_bloc.dart';
part 'bloc/locations_event.dart';
part 'bloc/locations_state.dart';
part '../../screens/locations_screen.dart';
part 'models/location.dart';
part 'locations_part.g.dart';

class LocationsPart extends StatelessWidget {
  const LocationsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationsBloc>(
      create: (context) => LocationsBloc(ApiClient())..add(LocationsOpened()),
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
