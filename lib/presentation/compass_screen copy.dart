import 'package:compass_app/bloc/compass_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<CompassBloc, CompassState>(
        builder: (context, state) {
          if (state is CompassInitial) {
            // Correctly pass the initial azimuth value
            BlocProvider.of<CompassBloc>(context)
                .add(CompassStarted(azimuth: 0));
            return const CircularProgressIndicator();
          } else if (state is CompassLoading) {
            return const CircularProgressIndicator();
          } else if (state is CompassLoaded) {
            return Text(
                'Orientation: ${state.azimuth.toStringAsFixed(0)} degrees');
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
