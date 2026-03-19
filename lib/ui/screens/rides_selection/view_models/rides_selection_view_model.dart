import '../../../../data/repositories/rides/ride_repository.dart';
import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../states/ride_preferences_state.dart';

class RidesSelectionViewModel {
  final RidePreferencesState _ridePreferencesState;
  final RideRepository _rideRepository;

  RidesSelectionViewModel({
    required RidePreferencesState ridePreferencesState,
    required RideRepository rideRepository,
  })  : _ridePreferencesState = ridePreferencesState,
        _rideRepository = rideRepository;

  RidePreference get selectedRidePreference => _ridePreferencesState.selectedPreference!;

  List<Ride> get matchingRides => _rideRepository.getRidesFor(selectedRidePreference);

  int get maxAllowedSeats => _ridePreferencesState.maxAllowedSeats;

  void selectPreference(RidePreference preference) => _ridePreferencesState.selectPreference(preference);
}
