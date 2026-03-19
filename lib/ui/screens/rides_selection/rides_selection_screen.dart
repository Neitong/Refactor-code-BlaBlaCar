import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/rides/ride_repository.dart';
import '../../../model/ride/ride.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../utils/animations_util.dart' show AnimationUtils;
import '../../states/ride_preferences_state.dart';
import '../../theme/theme.dart';
import 'view_models/rides_selection_view_model.dart';
import 'widgets/ride_preference_modal.dart';
import 'widgets/rides_selection_header.dart';
import 'widgets/rides_selection_tile.dart';

///
///  The Ride Selection screen allows user to select a ride, once ride preferences have been defined.
///  The screen also allow user to:
///   -  re-define the ride preferences
///   -  activate some filters.
///
class RidesSelectionScreen extends StatefulWidget {
  const RidesSelectionScreen({super.key});

  @override
  State<RidesSelectionScreen> createState() => _RidesSelectionScreenState();
}

class _RidesSelectionScreenState extends State<RidesSelectionScreen> {
  void onBackTap() {
    Navigator.pop(context);
  }

  void onFilterPressed() {
    // TODO
  }

  void onRideSelected(Ride ride) {
    // Later
  }

  void onPreferencePressed(RidesSelectionViewModel viewModel) async {
    // 1 - Navigate to the rides preference picker
    RidePreference? newPreference = await Navigator.of(context)
        .push<RidePreference>(
          AnimationUtils.createRightToLeftRoute(
            RidePreferenceModal(
              initialPreference: viewModel.selectedRidePreference,
            ),
          ),
        );

    if (newPreference != null) {
      viewModel.selectPreference(newPreference);
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = RidesSelectionViewModel(
      ridePreferencesState: context.watch<RidePreferencesState>(),
      rideRepository: context.read<RideRepository>(),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m, right: BlaSpacings.m, top: BlaSpacings.s),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: viewModel.selectedRidePreference,
              onBackPressed: onBackTap,
              onFilterPressed: onFilterPressed,
              onPreferencePressed: () => onPreferencePressed(viewModel),
            ),
        
            SizedBox(height: 100),
        
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.matchingRides.length,
                itemBuilder: (ctx, index) => RideSelectionTile(
                  ride: viewModel.matchingRides[index],
                  onPressed: () => onRideSelected(viewModel.matchingRides[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
