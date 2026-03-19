import '../../../data/dummy_data.dart';
import '../../../model/ride/ride.dart';
import '../../../model/ride_pref/ride_pref.dart';
import 'ride_repository.dart';

class RideRepositoryMock implements RideRepository {
  final List<Ride> _rides;

  RideRepositoryMock({List<Ride>? rides}) : _rides = rides ?? fakeRides;

  @override
  List<Ride> getAllRides() {
    return _rides;
  }

  @override
  List<Ride> getRidesFor(RidePreference preference) {
    return _rides
        .where(
          (ride) =>
              ride.departureLocation == preference.departure &&
              ride.arrivalLocation == preference.arrival &&
              ride.availableSeats >= preference.requestedSeats,
        )
        .toList();
  }
}
