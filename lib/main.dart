import 'package:compass_app/bloc/compass_bloc.dart';
import 'package:compass_app/presentation/compass_screen%20copy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (context) => CompassBloc(),
          child: CompassScreen(),
        ),
      ),
    );
  }
}
