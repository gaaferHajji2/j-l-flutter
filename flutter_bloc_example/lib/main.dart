import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/weather_bloc.dart';
import 'package:flutter_bloc_example/data/data_provider/weather_data_provider.dart';
import 'package:flutter_bloc_example/data/repository/weather_repository.dart';
import 'package:flutter_bloc_example/presentations/screens/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Note: We have also MultiRepositoryProvider
    return RepositoryProvider(
      create: (context) =>
          WeatherRepository(weatherDataProvider: WeatherDataProvider()),
      child: BlocProvider(
        create: (context) =>
            WeatherBloc(weatherRepository: context.read<WeatherRepository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(useMaterial3: true),
          home: const WeatherScreen(),
        ),
      ),
    );
  }
}
