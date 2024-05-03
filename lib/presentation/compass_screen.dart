import 'package:compass_app/bloc/compass_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompassBloc(),
      child: BlocBuilder<CompassBloc, CompassState>(
        builder: (context, state) {
          if (state is CompassInitial) {
            // Dispatch the CompassStarted event after the bloc is initialized
            BlocProvider.of<CompassBloc>(context).add(CompassStarted(azimuth: 0));
            return CircularProgressIndicator();
          } else if (state is CompassLoading) {
            return CircularProgressIndicator();
          } else if (state is CompassLoaded) {
            return Text('Orientation: ${state.azimuth.toStringAsFixed(2)} degrees');
          } else if (state is CompassError) {
            return Text('Error: ${state.message}');
          } else {
            return Text('Unknown state');
          }
        },
      ),
    );
  }
}

