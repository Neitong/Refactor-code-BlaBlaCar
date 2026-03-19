import 'package:flutter/material.dart';

import '../../../../data/repositories/rides/ride_repository.dart';
import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../states/ride_preferences_state.dart';

class RidesSelectionViewModel extends ChangeNotifier {
  final RidePreferencesState _ridePreferencesState;
  final RideRepository _rideRepository;
  VoidCallback? _ridePrefsListener;

  RidesSelectionViewModel({
    required RidePreferencesState ridePreferencesState,
    required RideRepository rideRepository,
  })  : _ridePreferencesState = ridePreferencesState,
        _rideRepository = rideRepository;

  RidePreference get selectedRidePreference => _ridePreferencesState.selectedPreference!;

  List<RidePreference> get preferenceHistory =>
      _ridePreferencesState.preferenceHistory.reversed.toList();

  List<Ride> get matchingRides =>
      _rideRepository.getRidesFor(selectedRidePreference);

  int get maxAllowedSeats => _ridePreferencesState.maxAllowedSeats;

  void startListening() {
    _ridePrefsListener = () => notifyListeners();
    _ridePreferencesState.addListener(_ridePrefsListener!);
  }

  void selectPreference(RidePreference preference) =>
      _ridePreferencesState.selectPreference(preference);

  @override
  void dispose() {
    if (_ridePrefsListener != null) {
      _ridePreferencesState.removeListener(_ridePrefsListener!);
    }
    super.dispose();
  }
}
