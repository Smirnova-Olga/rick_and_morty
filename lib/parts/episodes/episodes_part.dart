library episode_part;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/parts/episodes/mock_data/mock_data.dart';

part 'bloc/episodes_bloc.dart';
part 'bloc/episodes_event.dart';
part 'bloc/episodes_state.dart';
part 'models/episode.dart';
part '../../screens/episodes_screen.dart';
part 'episodes_part.g.dart';
