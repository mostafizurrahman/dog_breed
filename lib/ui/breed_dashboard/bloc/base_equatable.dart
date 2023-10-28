import 'package:dog_breed/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
part 'dashboard_events.dart';
part 'dashboard_states.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object?> get props => [];
}

abstract class _BreedEquatableEvent extends DashboardEvent {
  final BreedEntity breedEntity;
  const _BreedEquatableEvent({required this.breedEntity});
  @override
  List<Object?> get props => [
        breedEntity.breed,
        breedEntity.subBreed,
      ];
  @override
  String toString() {
    return 'breed ${breedEntity.breed}, '
        'sub-breed ${breedEntity.subBreed}';
  }
}

@immutable
abstract class DashboardState extends Equatable {
  const DashboardState();
}

class DashboardErrorState extends DashboardState {
  final String error = 'Fail to load data';
  const DashboardErrorState();

  @override
  List<Object?> get props => [
        error,
        DateTime.now().millisecondsSinceEpoch,
      ];
}

class DashboardLoadingState extends DashboardState {
  const DashboardLoadingState();
  @override
  List<Object?> get props => [DateTime.now().millisecondsSinceEpoch];
}

abstract class _BreedEquatableState<T> extends DashboardState {
  final DogData<T> dogData;
  const _BreedEquatableState({required this.dogData});
  @override
  List<Object?> get props => [
        value(data: dogData.dogs),
        dogData.status,
        DateTime.now().millisecondsSinceEpoch,
      ];

  String value({required final T data});

  @override
  String toString() {
    return 'status ${dogData.status}, '
        'data ${value(data: dogData.dogs)}';
  }
}
