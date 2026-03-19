import 'package:provider/provider.dart';

import 'data/repositories/locations/location_repository.dart';
import 'data/repositories/locations/location_repository_mock.dart';
import 'data/repositories/ride_preferences/ride_preferences_repository.dart';
import 'data/repositories/ride_preferences/ride_preferences_repository_mock.dart';
import 'data/repositories/rides/ride_repository.dart';
import 'data/repositories/rides/ride_repository_mock.dart';
import 'main_common.dart';
import 'ui/states/ride_preferences_state.dart';

List<InheritedProvider> get devProviders {
  return [
    Provider<LocationRepository>(create: (_) => LocationRepositoryMock()),
    Provider<RideRepository>(create: (_) => RideRepositoryMock()),
    Provider<RidePreferencesRepository>(
      create: (_) => RidePreferencesRepositoryMock(),
    ),
    ChangeNotifierProvider<RidePreferencesState>(
      create: (context) => RidePreferencesState(
        repository: context.read<RidePreferencesRepository>(),
      ),
    ),
  ];
}

void mainDev() {
  mainCommon(devProviders);
}