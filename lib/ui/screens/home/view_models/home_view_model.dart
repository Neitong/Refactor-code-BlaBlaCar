import 'package:flutter/material.dart';

import '../../../../model/ride_pref/ride_pref.dart';
import '../../../states/ride_preferences_state.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferencesState _ridePreferencesState;
  VoidCallback? _ridePrefsListener;

  HomeViewModel({required RidePreferencesState ridePreferencesState})
      : _ridePreferencesState = ridePreferencesState;

  RidePreference? get selectedPreference => _ridePreferencesState.selectedPreference;

  List<RidePreference> get history => _ridePreferencesState.preferenceHistory.reversed.toList();

  int get maxAllowedSeats => _ridePreferencesState.maxAllowedSeats;

  void startListening() {
    _ridePrefsListener ??= () => notifyListeners();
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
