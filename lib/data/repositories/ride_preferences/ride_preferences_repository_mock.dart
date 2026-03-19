import '../../../model/ride_pref/ride_pref.dart';
import 'ride_preferences_repository.dart';

class RidePreferencesRepositoryMock implements RidePreferencesRepository {
  final List<RidePreference> _history = [];
  RidePreference? _selectedPreference;

  @override
  int get maxAllowedSeats => 8;

  @override
  RidePreference? getSelectedPreference() {
    return _selectedPreference;
  }

  @override
  List<RidePreference> getPreferenceHistory() {
    return _history;
  }

  @override
  void selectPreference(RidePreference preference) {
    if (_selectedPreference == preference) return;
    _selectedPreference = preference;
    _history.add(preference);
  }
}
