import 'package:flutter/material.dart';

import '../../data/repositories/ride_preferences/ride_preferences_repository.dart';
import '../../model/ride_pref/ride_pref.dart';

class RidePreferencesState extends ChangeNotifier {
  final RidePreferencesRepository _repository;

  RidePreferencesState({required RidePreferencesRepository repository})
      : _repository = repository;

  int get maxAllowedSeats => _repository.maxAllowedSeats;

  RidePreference? get selectedPreference => _repository.getSelectedPreference();

  List<RidePreference> get preferenceHistory => _repository.getPreferenceHistory();

  void selectPreference(RidePreference preference) {
    if(preference == selectedPreference) return;
    
    _repository.selectPreference(preference);
    notifyListeners();
  }
}
