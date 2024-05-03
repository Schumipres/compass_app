part of 'compass_bloc.dart';

abstract class CompassState extends Equatable {
  const CompassState();

  @override
  List<Object> get props => [];
}

class CompassInitial extends CompassState {}

class CompassLoading extends CompassState {}

class CompassLoaded extends CompassState {
  final double azimuth;

  CompassLoaded({required this.azimuth});

  @override
  List<Object> get props => [azimuth];
}

class CompassError extends CompassState {
  final String message;

  CompassError({required this.message});

  @override
  List<Object> get props => [message];
}
