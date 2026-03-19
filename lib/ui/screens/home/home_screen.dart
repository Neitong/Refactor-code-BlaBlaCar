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
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel(
      ridePreferencesState: context.read<RidePreferencesState>(),
    );
    _viewModel.addListener(_onViewModelChanged);
    _viewModel.startListening();
  }

  void _onViewModelChanged() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  void dispose() {
    _viewModel.removeListener(_onViewModelChanged);
    _viewModel.dispose();
    super.dispose();
  }

  void onRidePrefSelected(RidePreference selectedPreference) async {
    _viewModel.selectPreference(selectedPreference);

    await Navigator.of(
      context,
    ).push(AnimationUtils.createBottomToTopRoute(const RidesSelectionScreen()));
  }

  @override
  Widget build(context) {
    return HomeContent(
      viewModel: _viewModel,
      onRidePrefSelected: onRidePrefSelected,
    );
  }
}
