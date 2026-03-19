import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/ride_preferences_state.dart';
import '../../../utils/animations_util.dart';
import '../rides_selection/rides_selection_screen.dart';
import 'view_models/home_view_model.dart';
import 'widgets/home_content.dart';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) {
        final viewModel = HomeViewModel(
          ridePreferencesState: context.read<RidePreferencesState>(),
        );
        viewModel.startListening();
        return viewModel;
      },
      builder: (context, _) {
        final viewModel = context.watch<HomeViewModel>();

        Future<void> onRidePrefSelected(RidePreference selectedPreference) async {
          viewModel.selectPreference(selectedPreference);

          await Navigator.of(context).push(
            AnimationUtils.createBottomToTopRoute(const RidesSelectionScreen()),
          );
        }

        return HomeContent(
          viewModel: viewModel,
          onRidePrefSelected: onRidePrefSelected,
        );
      },
    );
  }
}
