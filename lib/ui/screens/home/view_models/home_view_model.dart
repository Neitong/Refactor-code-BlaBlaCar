import '../../../../model/ride_pref/ride_pref.dart';
import '../../../states/ride_preferences_state.dart';

class HomeViewModel {
  final RidePreferencesState _ridePreferencesState;

  HomeViewModel({required RidePreferencesState ridePreferencesState})
      : _ridePreferencesState = ridePreferencesState;

  RidePreference? get selectedPreference => _ridePreferencesState.selectedPreference;

  List<RidePreference> get history =>
      _ridePreferencesState.preferenceHistory.reversed.toList();

  int get maxAllowedSeats => _ridePreferencesState.maxAllowedSeats;

  void selectPreference(RidePreference preference) {
    _ridePreferencesState.selectPreference(preference);
  }
}
