part of 'compass_bloc.dart';

abstract class CompassEvent extends Equatable {
  const CompassEvent();

  @override
  List<Object> get props => [];
}

class CompassStarted extends CompassEvent {
  final double azimuth;

  CompassStarted({required this.azimuth});

  @override
  List<Object> get props => [azimuth];
}

class CompassAzimuthUpdated extends CompassEvent {
  final double azimuth;

  CompassAzimuthUpdated({required this.azimuth});

  @override
  List<Object> get props => [azimuth];
}
