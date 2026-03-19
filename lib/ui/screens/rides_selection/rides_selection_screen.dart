import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/rides/ride_repository.dart';
import '../../../model/ride/ride.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../utils/animations_util.dart' show AnimationUtils;
import '../../states/ride_preferences_state.dart';
import 'view_models/rides_selection_view_model.dart';
import 'widgets/ride_preference_modal.dart';
import 'widgets/rides_selection_content.dart';

///
///  The Ride Selection screen allows user to select a ride, once ride preferences have been defined.
///  The screen also allow user to:
///   -  re-define the ride preferences
///   -  activate some filters.
///
class RidesSelectionScreen extends StatelessWidget {
  const RidesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RidesSelectionViewModel>(
      create: (context) {
        final viewModel = RidesSelectionViewModel(
          ridePreferencesState: context.read<RidePreferencesState>(),
          rideRepository: context.read<RideRepository>(),
        );
        viewModel.startListening();
        return viewModel;
      },
      builder: (context, _) {
        final viewModel = context.watch<RidesSelectionViewModel>();

        void onBackTap() {
          Navigator.pop(context);
        }

        void onFilterPressed() {
          // TODO
        }

        void onRideSelected(Ride ride) {
          // Later
        }

        Future<void> onPreferencePressed() async {
          final newPreference = await Navigator.of(context).push<RidePreference>(
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

        return RidesSelectionContent(
          viewModel: viewModel,
          onBackPressed: onBackTap,
          onFilterPressed: onFilterPressed,
          onPreferencePressed: onPreferencePressed,
          onRideSelected: onRideSelected,
        );
      },
    );
  }
}
