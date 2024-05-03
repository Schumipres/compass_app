import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:equatable/equatable.dart';

part 'compass_event.dart';
part 'compass_state.dart';

class CompassBloc extends Bloc<CompassEvent, CompassState> {
  StreamSubscription<MagnetometerEvent>? _magnetometerSubscription;
  StreamSubscription<GyroscopeEvent>? _gyroscopeSubscription;

  CompassBloc() : super(CompassInitial()) {
    // Register the event handler for CompassStarted
    on<CompassStarted>((event, emit) async {
      emit(CompassLoading());
      try {
        return emit.forEach(magnetometerEventStream(),
            onData: (MagnetometerEvent event) {
          final azimuth = _calculateAzimuth(event.x, event.y);
          return CompassLoaded(azimuth: azimuth);
        });
      } catch (e) {
        emit(CompassError(message: e.toString()));
      }
    });
  }

  double _calculateAzimuth(double x, double y) {
    // Calculate azimuth based on magnetometer data
    // This is a simplified example. You might need a more complex calculation
    // depending on your requirements.
    double azimuth = atan2(x, y) * 180 / pi;
    azimuth = 360 - (azimuth + 360) % 360;
    if (azimuth == 360) {
      azimuth = 0;
    }
    return azimuth;
  }

  @override
  Future<void> close() {
    _magnetometerSubscription?.cancel();
    _gyroscopeSubscription?.cancel();
    return super.close();
  }
}
