import '../../../model/ride_pref/ride_pref.dart';

abstract class RidePreferencesRepository {
  int get maxAllowedSeats;

  RidePreference? getSelectedPreference();

  List<RidePreference> getPreferenceHistory();

  void selectPreference(RidePreference preference);
}
