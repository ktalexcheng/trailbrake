part of 'dashboard_bloc.dart';

// Following naming convention outlined here:
// https://bloclibrary.dev/#/blocnamingconventions?id=state-conventions
@immutable
abstract class DashboardState {
  // List<RideRecord> get rideCatalog;
}

class DashboardInitial extends DashboardState {
  // @override
  // dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class DashboardUnauthenticated extends DashboardState {}

class DashboardGetCatalogInProgress extends DashboardState {
  // @override
  // dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class DashboardGetCatalogSuccess extends DashboardState {
  DashboardGetCatalogSuccess({
    required this.rideCatalog,
  }) {
    _sortRideCatalog;
  }

  // @override
  final List<RideRecord> rideCatalog;

  void _sortRideCatalog([int Function(dynamic, dynamic)? compare]) {
    if (compare != null) {
      rideCatalog.sort(compare);
    } else {
      rideCatalog.sort((a, b) => a.rideDate.compareTo(b.rideDate));
    }
  }

  // @override
  // dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class DashboardGetCatalogFailure extends DashboardState {
  // @override
  // dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
